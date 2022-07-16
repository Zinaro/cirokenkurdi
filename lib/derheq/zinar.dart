import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Zinar extends StatefulWidget {
  const Zinar({Key? key}) : super(key: key);

  @override
  State<Zinar> createState() => _ZinarState();
}

class _ZinarState extends State<Zinar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.green, Colors.white]),
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
                      "Pêşvebir",
                      style: TextStyle(fontSize: 16),
                    )),
                  ),
                )
              ],
            ),
            Row(
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
                              width: 130,
                              height: 130,
                              decoration: const BoxDecoration(
                                color: Colors.yellowAccent,
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Container(
                                      width: 135,
                                      height: 135,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://pbs.twimg.com/profile_images/1542080501523046400/7E2nVfmd_400x400.jpg',
                                        fit: BoxFit.cover,
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
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Expanded(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  'Islam Zinar',
                                  style: TextStyle(
                                    color: Color(0xFF14181B),
                                    fontSize: 28,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Expanded(
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Text(
                                    "   Pêşvebirê vê sepanê ye. Heta ku ji destê wî tê ji bo pêşerojên zarokên Kurda dixebite. Bi Python û Flutter dizane û bernameyan diafirîne. Niha li Amed'ê dijî.",
                                    style: TextStyle(
                                      color: Colors.black54,
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
                )
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      width: 140,
                      height: 35,
                      constraints:
                          const BoxConstraints(maxHeight: 50, maxWidth: 140),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.pink, Colors.white],
                          ),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Colors.black,
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: InkWell(
                          onTap: () async {
                            const urlinsta = "https://instagram.com/zinarpy";
                            if (await canLaunchUrlString(urlinsta)) {
                              await launchUrlString(
                                urlinsta,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: const [
                                Icon(
                                  FontAwesomeIcons.instagram,
                                  color: Colors.blue,
                                  size: 24,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      "@zinarpy",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 140,
                      height: 35,
                      constraints: const BoxConstraints(maxHeight: 50),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.white, Colors.blue],
                          ),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Colors.black,
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: InkWell(
                          onTap: () async {
                            const urltwitter = "https://twitter.com/zinarpy";
                            if (await canLaunchUrlString(urltwitter)) {
                              await launchUrlString(
                                urltwitter,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: const [
                                Icon(
                                  FontAwesomeIcons.twitter,
                                  color: Colors.blue,
                                  size: 24,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      "@zinarpy",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
