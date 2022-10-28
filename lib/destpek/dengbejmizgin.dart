import 'package:flutter/material.dart';

class DengbejMizgin extends StatefulWidget {
  const DengbejMizgin({Key? key}) : super(key: key);

  @override
  State<DengbejMizgin> createState() => _DengbejMizginState();
}

class _DengbejMizginState extends State<DengbejMizgin> {
  bool weneheye = true;
  String urlwene =
      "https://firebasestorage.googleapis.com/v0/b/cirok-kurdi.appspot.com/o/derbar%2Fwene%2Fmizgin.jpg?alt=media&token=a8df6c0b-2b50-49c9-984b-b22b12270479";
  // ignore: body_might_complete_normally_nullable
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
                        child: Text("Dengbêj",
                            style: TextStyle(
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
                                      child: weneheye
                                          ? Image.network(
                                              urlwene,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset("assets/gulistan.jpg",
                                              fit: BoxFit.cover),
                                    ),
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
                Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: const Center(
                        child: Text(
                      "Mizgîn Xan",
                      style: TextStyle(fontSize: 28),
                    )))
              ],
            ),
            const SizedBox(
              height: 25,
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
                        width: 270,
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
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: const [
                                            Text(
                                              " Ji Dengê Mizgînê Guhdarî Bike",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Icon(
                                              Icons.arrow_right_alt,
                                              color: Colors.white,
                                            )
                                          ],
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
}
