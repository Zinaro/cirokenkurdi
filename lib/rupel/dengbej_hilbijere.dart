// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './ciroks.dart';

class DengbejHilbijere extends StatelessWidget {
  final String docmnID;
  DengbejHilbijere({
    super.key,
    required this.docmnID,
  });
  bool weneheye = true;
  @override
  Widget build(BuildContext context) {
    CollectionReference rupdengg =
        FirebaseFirestore.instance.collection("dengbejs");
    return FutureBuilder<DocumentSnapshot>(
        future: rupdengg.doc(docmnID).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: -4,
                          blurRadius: 8,
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(0, 24))
                    ]),

                ///)),
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: -4,
                                      blurRadius: 8,
                                      color: Colors.black.withOpacity(0.5),
                                      offset: const Offset(0, 6))
                                ]),
                            child: Center(
                                child: Text(data['dengbejNavnas'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ))),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 4),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 10, right: 4, bottom: 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 120,
                                      decoration: const BoxDecoration(
                                        color: Colors.pinkAccent,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(3),
                                            child: Container(
                                                width: 120,
                                                height: 120,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  data['dengbejWene'],
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                          stackTrace) => data['dengbejZayend'] ?
                                                      Image.asset(
                                                          "assets/gulistan.jpg",
                                                          fit: BoxFit.cover): Image.asset(
                                                          "assets/firat.jpg",
                                                          fit: BoxFit.cover),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  child: Center(
                                      child: SelectableText(data['dengbejNav'],
                                          style: GoogleFonts.rubikBubbles(
                                            color: Colors.black,
                                            fontSize: 22,
                                          )))),
                              Center(
                                  child: SelectableText(
                                data['dengbejBio'],
                                style: GoogleFonts.oswald(
                                    fontSize: 12, color: Colors.black87),
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color.fromARGB(255, 248, 126, 167),
                                        Color.fromARGB(255, 248, 126, 167)
                                      ],
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        spreadRadius: 0.8,
                                        blurRadius: 6,
                                        color: Colors.black45,
                                        offset: Offset(0, 4),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(30)),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color.fromARGB(255, 250, 99, 149),
                                          Color.fromARGB(255, 250, 99, 149)
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Colors.pinkAccent,
                                            Colors.pinkAccent
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color.fromARGB(255, 252, 51, 118),
                                              Color.fromARGB(255, 252, 51, 118)
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => Ciroks(
                                                              idYaDengbej:
                                                                  docmnID,
                                                              dengbejNav: data[
                                                                  'dengbejNav'],
                                                              dengbejWene: data[
                                                                  'dengbejWene'])),
                                                    );
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          " Ji Dengê ${data['dengbejNav']}",
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      const Icon(
                                                        Icons.arrow_right_alt,
                                                        color: Colors.white,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            );
          }
          return Column(
            children: [
              Center(
                child: Text(
                  "Bar dibe...",
                  style:
                      GoogleFonts.oswald(fontSize: 22, color: Colors.black87),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(child: CircularProgressIndicator()),
              const SizedBox(
                height: 5,
              )
            ],
          );
        });
  }
}
