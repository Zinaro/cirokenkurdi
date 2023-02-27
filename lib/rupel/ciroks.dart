// ignore_for_file: must_be_immutable, unnecessary_null_comparison, avoid_function_literals_in_foreach_calls
import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import './cirok_hilbijere.dart';
import '../widgets/bottombar.dart';

class Ciroks extends StatefulWidget {
  String idYaDengbej;
  String dengbejNav;
  String dengbejWene;
  Ciroks({Key? key,
  required this.idYaDengbej,
  required this.dengbejNav,
  required this.dengbejWene,
  }) : super(key: key);
  @override
  State<Ciroks> createState() => _CiroksState();
}
class _CiroksState extends State<Ciroks> {
  ControllerenGisti controllerenGisti = Get.put(ControllerenGisti());
  int indexx = 0;
  List docIDyaCiroka = [];
  Future getDocIDD() async {
    await FirebaseFirestore.instance
        .collection("dengbejs/${widget.idYaDengbej}/ciroks")
        .orderBy("cirokSterk", descending: true)
        .get()
        .then((snpsht) => snpsht.docs.forEach((element) {
              docIDyaCiroka.add(element.reference.id);
            }));       
  }
  @override
  void initState() {
    getDocIDD();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference rupdengg =
        FirebaseFirestore.instance.collection("dengbejs").doc(widget.idYaDengbej).collection("ciroks");
    return FutureBuilder(
      future: rupdengg.get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done){
          return Scaffold(
          backgroundColor: const Color.fromARGB(255, 125, 252, 252),
          bottomNavigationBar: BottomBar(context),
          appBar: AppBar(
            leading: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            iconTheme: IconTheme.of(context),
            backgroundColor: Colors.white70,
            shadowColor: Colors.black,
            title: Text(
              // ! naveDengbej
              "Dengê ${widget.dengbejNav}",
              style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
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
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 10),
                itemCount: docIDyaCiroka.length,
                itemBuilder: (context, index){
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      height: 280,
                      child: CirokHilbijere(
                        cirokdocID: docIDyaCiroka[index],
                        dengbejID: widget.idYaDengbej,
                        dengbejWene: widget.dengbejWene,
                        dengbejNav: widget.dengbejNav,),),
                  ],
                );
              }),
            ),
          ),
        );
        } else {
          return Scaffold(
          backgroundColor: const Color.fromARGB(255, 125, 252, 252),
          bottomNavigationBar: BottomBar(context),
          appBar: AppBar(
            leading: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            iconTheme: IconTheme.of(context),
            backgroundColor: Colors.white70,
            shadowColor: Colors.black,
            title: const Text(
              "Bar Dibe...",
              style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
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
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      height: 280,
                      child: const Center(child: CircularProgressIndicator()),),
                  ],
                )
            ),
          ),
        );
        }
      }
    );
  }
}