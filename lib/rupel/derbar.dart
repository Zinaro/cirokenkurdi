// ignore_for_file: unnecessary_null_comparison, avoid_function_literals_in_foreach_calls

import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../derbar/agahdari.dart';
import '../derbar/alikari.dart';
import '../derbar/dengbej/dengbejs.dart';
import '../derbar/derheqe_cirokan.dart';
import '../derbar/mercuniheni.dart';
import '../derbar/sponsor/sponsors.dart';
import '../derbar/teknik/tekniks.dart';
import '../widgets/bottombar.dart';

class Derbar extends StatefulWidget {
  const Derbar({Key? key}) : super(key: key);

  @override
  State<Derbar> createState() => _DerbarState();
}

class _DerbarState extends State<Derbar> {
  ControllerenGisti controllerenGisti = Get.put(ControllerenGisti());
  List docIdTekniks = [];
  List docIdDengbejs = [];
  List docIdSponsors = [];
  bool getdocFinish = false;
  CollectionReference iconbuton =
      FirebaseFirestore.instance.collection("derbar");
  CollectionReference tekniks =
      FirebaseFirestore.instance.collection("tekniks");
  Future getDocIDD() async {
    await FirebaseFirestore.instance
        .collection("tekniks")
        .orderBy("teknikSterk", descending: true)
        .get()
        .then((snpsht) => snpsht.docs.forEach((element) {
              docIdTekniks.add(element.reference.id);
            }));
    await FirebaseFirestore.instance
        .collection("dengbejs")
        .orderBy("dengbejSterk", descending: true)
        .get()
        .then((snpsht) => snpsht.docs.forEach((element) {
              docIdDengbejs.add(element.reference.id);
            }));
    await FirebaseFirestore.instance
        .collection("sponsors")
        .orderBy("sponsorSterk", descending: true)
        .get()
        .then((snpsht) => snpsht.docs.forEach((element) {
              docIdSponsors.add(element.reference.id);
            }));
    await snapShats();
    getdocFinish = true;
  }

  Future snapShats() async {
    await FirebaseFirestore.instance
        .collection("derbar")
        .doc('sertumerc')
        .get();
    await FirebaseFirestore.instance.collection("derbar").doc('agahdari').get();
    await FirebaseFirestore.instance.collection("derbar").doc('derheq').get();
  }

  @override
  Widget build(BuildContext context) {
    var icnbtn = iconbuton.doc('iconbuton').get();
    return FutureBuilder(
        future: tekniks.get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 125, 252, 252),
              bottomNavigationBar: BottomBar(context),
              appBar: AppBar(
                backgroundColor: Colors.white70,
                shadowColor: Colors.black,
                title: const Text(
                  "Derbar",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.black),
                ),
                actions: [
                  FutureBuilder<DocumentSnapshot>(
                      future: icnbtn,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          Map<String, dynamic> data =
                              snapshot.data!.data() as Map<String, dynamic>;
                          return Row(
                            children: [
                              IconButton(
                                color: Colors.black,
                                icon: const Icon(Icons.star_border),
                                onPressed: () async {
                                  String urlplaystore = data['playUrl'];
                                  if (await canLaunchUrlString(urlplaystore)) {
                                    await launchUrlString(
                                      urlplaystore,
                                      mode: LaunchMode.externalApplication,
                                    );
                                  }
                                },
                                tooltip: "Ray Bidê",
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: IconButton(
                                  color: Colors.black,
                                  icon: const Icon(Icons.share),
                                  onPressed: () {
                                    Share.share(data['share']);
                                  },
                                  tooltip: "Parve Bike",
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      }),
                ],
                centerTitle: true,
                elevation: 20.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  //BorderRadius.only
                ),
              ),
              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/bg.jpeg'),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.1), BlendMode.dstATop),
                    fit: BoxFit.cover,
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 125, 252, 252),
                      Color.fromARGB(255, 125, 253, 253),
                    ],
                  ),
                ),
                child: FutureBuilder(
                    future: getDocIDD(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          getdocFinish) {
                        return ListView(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.all(5),
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Agahdari(),
                              const SizedBox(
                                height: 20,
                              ),
                              const Alikari(),
                              const SizedBox(
                                height: 20,
                              ),
                              Tekniks(
                                tekniksList: docIdTekniks,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Dengbejs(dengbejsList: docIdDengbejs),
                              const SizedBox(
                                height: 20,
                              ),
                              Sponsors(
                                sponsorList: docIdSponsors,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const MercenMe(),
                              const SizedBox(
                                height: 20,
                              ),
                              const DerheqeCirokanDe(),
                              const SizedBox(
                                height: 20,
                              ),
                            ]);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
