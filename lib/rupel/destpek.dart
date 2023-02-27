// ignore_for_file: non_constant_identifier_names, avoid_function_literals_in_foreach_calls, depend_on_referenced_packages, avoid_returning_null_for_void, avoid_print
import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './dengbej_hilbijere.dart';
import '../widgets/bottombar.dart';

class Destpek extends StatefulWidget {
  const Destpek({Key? key}) : super(key: key);

  @override
  State<Destpek> createState() => _DestpekState();
}

class _DestpekState extends State<Destpek> {
  ControllerenGisti controllerenGisti = Get.put(ControllerenGisti());
  FirebaseAuth auth = FirebaseAuth.instance;
  late User user;
  CollectionReference ciroks =
      FirebaseFirestore.instance.collection("dengbejs");
  List<String> DocIdYaMe = [];
  Future getDocIDD() async {
    await FirebaseFirestore.instance
        .collection("dengbejs")
        .orderBy('dengbejSterk', descending: true)
        .get()
        .then((snpsht) => snpsht.docs.forEach((element) {
              DocIdYaMe.add(element.reference.id);
            }));
  }
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDocIDD(),
        builder: (context, snapshot) {
          if (auth.currentUser?.uid != null &&
              snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 125, 252, 252),
              bottomNavigationBar: BottomBar(context),
              appBar: AppBar(
                backgroundColor: Colors.white70,
                shadowColor: Colors.black,
                title: const Text(
                  "Destpêk",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.black),
                ),
                centerTitle: true,
                elevation: 20.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  //BorderRadius.only
                ),
              ),
              body: SafeArea(
                child: Container(
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
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
                        Container(
                          margin: const EdgeInsets.only(right: 16, left: 16),
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: -4,
                                    blurRadius: 8,
                                    color: Colors.black.withOpacity(0.5),
                                    offset: const Offset(0, 6))
                              ]),
                          child: const Center(
                              child: Text("Dengbêj Hilbijêre",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ))),
                        ),
                        Expanded(
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: DocIdYaMe.length,
                              itemBuilder: ((context, index) {
                                return Column(children: [
                                  const SizedBox(height: 8),
                                  DengbejHilbijere(
                                    docmnID: DocIdYaMe[index],
                                  ),
                                  const SizedBox(height: 8),
                                ]);
                              })),
                        ),
                      ],
                    )),
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 125, 252, 252),
              bottomNavigationBar: BottomBar(context),
              appBar: AppBar(
                backgroundColor: Colors.white70,
                shadowColor: Colors.black,
                title: const Text(
                  "Destpêk",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.black),
                ),
                centerTitle: true,
                elevation: 20.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  //BorderRadius.only
                ),
              ),
              body: SafeArea(
                child: Container(
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
                    child: ListView(
                      children: [
                        Column(
                          children: const [
                            Center(
                                heightFactor: 15,
                                child: CircularProgressIndicator()),
                          ],
                        ),
                      ],
                    )),
              ),
            );
          }
        });
  }
}
