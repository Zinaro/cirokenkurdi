// ignore_for_file: avoid_print, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import './tima_teknike.dart';

class Tekniks extends StatelessWidget {
  List tekniksList;
  Tekniks({Key? key,required this.tekniksList,}) : super(key: key);
  String firat = "assets/firat.jpg";
  String gulistan = "assets/gulistan.jpg";
  @override
  Widget build(BuildContext context) {
    CollectionReference teknikcoll =
        FirebaseFirestore.instance.collection("tekniks");
    print(tekniksList);
    return FutureBuilder(
        future: teknikcoll.get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
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
                margin: const EdgeInsets.all(8),
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
                            child: const Center(
                                child: Text("Tîma Teknîkê",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ))),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: 
                          [Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TimaTeknike(
                                                teknikList: tekniksList,
                                              )));
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(right: 10, left: 10),
                                  width: 160,
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
                                          borderRadius: BorderRadius.circular(30)),
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
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "Tîma Teknîkê",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontWeight:
                                                      FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Icon(
                                              Icons.arrow_right_alt,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: tekniksList.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return FutureBuilder<DocumentSnapshot>(
                                        future: teknikcoll
                                            .doc(tekniksList[index])
                                            .get(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            Map<String, dynamic> data =
                                                snapshot.data!.data()
                                                    as Map<String, dynamic>;
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  right: 5, left: 5),
                                              width: 53,
                                              height: 53,
                                              decoration: const BoxDecoration(
                                                color: Colors.pinkAccent,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(1),
                                                    child: Container(
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape: BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                            data['teknikWene'],
                                                            fit: BoxFit.cover,
                                                            errorBuilder:
                                                                (context, error,
                                                                    stackTrace) {
                                                          return data[
                                                                  'teknikZayend']
                                                              ? Image.asset(
                                                                  gulistan)
                                                              : Image.asset(
                                                                  firat);
                                                        })),
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else {
                                            return const Center(child: CircularProgressIndicator());
                                          }
                                        });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
