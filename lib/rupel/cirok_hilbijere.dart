// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import './cirokmusic.dart';

class CirokHilbijere extends StatelessWidget {
  String cirokdocID;
  String dengbejID;
  String dengbejWene;
  String dengbejNav;

  CirokHilbijere({
    Key? key,
    required this.cirokdocID,
    required this.dengbejID,
    required this.dengbejWene,
    required this.dengbejNav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference rupdengg = FirebaseFirestore.instance
        .collection("dengbejs")
        .doc(dengbejID)
        .collection("ciroks");
    return FutureBuilder<DocumentSnapshot>(
        future: rupdengg.doc(cirokdocID).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CirokMusic(
                          cirokNav: data['cirokNav'],
                          cirokNavber: data['cirokNavber'],
                          cirokUrl: data['cirokUrl'],
                          cirokWene: data['cirokWene'])),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: -4,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 24), // changes position of shadow
                      ),
                    ],
                    color: const Color.fromARGB(255, 0, 112, 112),
                    image: DecorationImage(
                      image: NetworkImage(data['cirokWene']),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.9), BlendMode.dstATop),
                      onError: (exception, stackTrace) =>
                          const AssetImage("assets/error.png"),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      const SizedBox(height: 207, child: null),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(150, 0, 255, 255),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.transparent,
                                  height: 80,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            data['cirokNav'],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5,
                                              left: 10,
                                              right: 5,
                                              bottom: 5),
                                          child: Text(
                                            data['cirokAgahi'],
                                            style: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color.fromARGB(40, 0, 0, 0),
                                      Color.fromARGB(40, 0, 0, 0)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 125,
                                height: 40,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: const BoxDecoration(
                                        color: Colors.redAccent,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Container(
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                    dengbejWene,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                  return Image.asset(
                                                      "assets/gulistan.jpg");
                                                })),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Text(
                                          dengbejNav,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Column(
              children: const [
                Center(
                  child: Text(
                    "Bar dibe...",
                    style: TextStyle(fontSize: 22, color: Colors.black87),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(child: CircularProgressIndicator()),
                SizedBox(
                  height: 5,
                )
              ],
            );
          }
        });
  }
}
