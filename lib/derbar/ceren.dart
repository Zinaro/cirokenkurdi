import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Ceren extends StatefulWidget {
  const Ceren({Key? key}) : super(key: key);

  @override
  State<Ceren> createState() => _CerenState();
}

class _CerenState extends State<Ceren> {
  bool weneheye = false;
  String urlwene =
      "https://firebasestorage.googleapis.com/v0/b/cirok-kurdi.appspot.com/o/derbar%2Fwene%2Fceren.jpg?alt=media&token=7c5d2ee3-c732-48b2-a5cb-8e15f08c245c";
  @override
  void initState() {
    super.initState();
    linkUrl();
    weneheye = true;
  }

  // ignore: body_might_complete_normally_nullable
  Future<String?> linkUrl() async {
    try {
      final storageRef = await FirebaseStorage.instance
          .ref("derbar/wene/ceren.jpg")
          .getDownloadURL();

      setState(() {
        urlwene = storageRef;
      });
    } catch (e) {
      rethrow;
    }
  }

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
                        child: Text("Designer",
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
                              width: 75,
                              height: 75,
                              decoration: const BoxDecoration(
                                color: Colors.pinkAccent,
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Container(
                                      width: 75,
                                      height: 75,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: weneheye
                                          ? Image.network(urlwene,
                                              fit: BoxFit.cover, errorBuilder:
                                                  (context, error, stackTrace) {
                                              return Image.asset(
                                                  "assets/gulistan.jpg");
                                            })
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
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 4, left: 4, right: 70),
                                child: Text('Ceren Yildiran',
                                    style: GoogleFonts.rubikBubbles(
                                      color: Colors.black,
                                      fontSize: 18,
                                    )),
                              ),
                            ),
                          ),
                        ],
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
                                    "   Wênesazekî Kurd e. Bi web dîzaynê ve mijûl dibe. Alîkariya dîzayna vê sepanê kir. Temenê wê 24 e. Niha li Swêd'ê dijî. ",
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
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 150,
                        height: 33,
                        constraints:
                            const BoxConstraints(maxHeight: 33, maxWidth: 140),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.white, Colors.pink],
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
                              const urlinsta =
                                  "https://instagram.com/cerenyildirann";
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
                                    color: Colors.redAccent,
                                    size: 24,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Text(
                                        "@cerenyildirann",
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
