// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Agahdari extends StatelessWidget {

  const Agahdari({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference agahdari =
        FirebaseFirestore.instance.collection("derbar");
    return FutureBuilder<DocumentSnapshot>(
        future: agahdari.doc('agahdari').get(),
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
                            child: Center(
                                child: Text(data['aNavber0'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ))),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        Center(
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                if (data['aNavber${(index).toString()}'] !=
                                        "" &&
                                    index != 0) {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, right: 4, bottom: 4),
                                              child: SelectableText(
                                                data[
                                                    'aNavber${(index).toString()}'
                                                        .replaceAll(
                                                            r'\n', '\n')],
                                                style: GoogleFonts.oswald(
                                                    fontSize: 14,
                                                    color: Colors.black87),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
