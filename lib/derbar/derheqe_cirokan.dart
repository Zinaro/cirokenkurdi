// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DerheqeCirokanDe extends StatelessWidget {

  const DerheqeCirokanDe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference derheq =
        FirebaseFirestore.instance.collection("derbar");
    return FutureBuilder<DocumentSnapshot>(
      future: derheq.doc('derheq').get(),
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
                            child: Text(data['dNavber0'],
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
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  
                  children: [
                    Center(
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            if (data['dNavber${(index).toString()}'] != "" && index != 0) {
                              return Container(
                                padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 4, right: 4, bottom: 4),
                                        child: SelectableText(
                                          data[
                                              'dNavber${index.toString()}'.toString().replaceAll(RegExp("\n"), "\n")],
                                          style: GoogleFonts.oswald(
                                              fontSize: 14,
                                              color: Colors.black87),
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
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        );}
        else {
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
                            child: Text("Bar Dibe..",
                                style:  TextStyle(
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
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const  [
                    CircularProgressIndicator(),
                     SizedBox(
                      height: 8,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        );
        }
      }
    );
  }
}
/*
   Çîrokên di sepana me de tên guhdarî kirin zêdetir ji pirtûka Selîm Temo ya "Serê Şevê Çîrokek" hatiye girtin. Spasiyên xwe ji Selîm Temo re, ji Zinarê Xamo re, ji weşanxaneya Dara re, ji Berhevkarên çîrokan re û ji hemû xebatkarên zimanê Kurdî re dişînin.

Şengê û Pengê (Çîroka Kurdî)
Çavkanî: zinarexamo.blogspot.com - Zinarê Xamo

Bûk û Tûtûk (Çîroka Kurdî) - Berhevkar: Bawer Andok
Rovî û Quling (Çîroka Kurdî) - Berhevkar: Mahmut Barik
Mîh û Gur (Çîroka Kurdî) - Berhevkar: Remezanê Botî
Lawikê Tiral (Çîroka Uygûrî)
Şêr û Mişk (Çîroka Yewnanî)
Şampiyonên Çarqevazkan (Çîroka Denmarkî)
Serê Mîhê (Çîroka Afrîkî)
Çavkanî: Selîm Temo, 2021, Serê Şevê Çîrokek, Amed, Weşanxaneya Dara

   Heweskar û evîndar cuda ne. Heweskar li dû berjewendiyên xwe ne, evîndar xwe didayê evîna xwe dikin. Tiştên rojane dikarin hewesa meriv di dilê meriv de vemirînin, lê evîn jiyan bi xwe ye.
 */