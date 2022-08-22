import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Agahdari extends StatefulWidget {
  const Agahdari({Key? key}) : super(key: key);

  @override
  State<Agahdari> createState() => _AgahdariState();
}

class _AgahdariState extends State<Agahdari> {
  String agahdari =
      "   Em vê sepanê diyariyê hemû zarokên Kurda dikin. Dinya bi we xweş e. Em ji we hez dikin ronahiyên çavên me.";

  String agahdari2 =
      "   Ji bo pêşniyariyên xwe ji kerema xwe re bi me re bikevin têkiliyê. Fikrên we li ser sepanên Kurdî hebin hûn dikarin bi me re parve bikin. Ji bo sponsoriyê jî hûn dikarin ji me re alîkar bibin.";
  @override
  Widget build(BuildContext context) {
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
                        child: Text("Agahdarî",
                            style: TextStyle(
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
                Container(
                  padding: const EdgeInsets.only(left: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 4, right: 4, bottom: 4),
                            child: Text(
                              agahdari,
                              style: GoogleFonts.oswald(
                                  fontSize: 14, color: Colors.black87),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 4, right: 4, bottom: 4),
                            child: Text(
                              agahdari2,
                              style: GoogleFonts.oswald(
                                  fontSize: 14, color: Colors.black87),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
