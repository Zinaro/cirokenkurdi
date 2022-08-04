import 'package:flutter/material.dart';

class Agahdari extends StatefulWidget {
  const Agahdari({Key? key}) : super(key: key);

  @override
  State<Agahdari> createState() => _AgahdariState();
}

class _AgahdariState extends State<Agahdari> {
  String agahdari =
      "   Em vê sepanê diyariyê hemû zarokên Kurda dikin. Dinya bi we xweş e. Em ji we hez dikin ronahiyên çavên me.";

  String agahdari2 =
      "   Ji bo pêşniyariyên xwe ji kerema xwe re bi me re bikevin têkiliyê. Fikrên we li ser sepanên Kurdî hebin hûn dikarin bi me re parve bikin. Ji bo sponsoriyê jî hûn dikarin ji me re alîkar bibin";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.yellow, Colors.white]),
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 8, color: Colors.black26, offset: Offset(0, 8))
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
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.black12, Colors.black12],
                      ),
                    ),
                    margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
                    child: const Center(
                        child: Text(
                      "Agahdarî",
                      style: TextStyle(fontSize: 16),
                    )),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          agahdari,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          agahdari2,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
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
    );
  }
}
