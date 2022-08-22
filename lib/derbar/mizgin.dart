import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Mizgin extends StatefulWidget {
  const Mizgin({Key? key}) : super(key: key);

  @override
  State<Mizgin> createState() => _MizginState();
}

class _MizginState extends State<Mizgin> {
  bool weneheye = false;
  String urlwene =
      "https://firebasestorage.googleapis.com/v0/b/ciroken-kurdi.appspot.com/o/derheq%2Fwene%2Fmizgin.jpg?alt=media&token=8327b606-d465-42c4-bb8c-153b7f795e92";
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
          .ref("derheq/wene/mizgin.jpg")
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
                                    top: 4, left: 4, right: 100),
                                child: Text('Mizgîn Xan',
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
                                    "   Ji zarokatiya xwe vir de ji xwendin û nivîsandinê pir hez dike. Helbestên Melayê Cizîrî ji bona wê gerdûneke bi taybete. Bi eslê xwe ji Mêrdîn'ê ye û aniha li Mêrdîn'ê dijî. Temenê wê 27 e. Daxwaza wê di mayîna emrê xwe de ji bo ziman û wêje ya Kurdî xebate.",
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
                        margin: const EdgeInsets.only(left: 10),
                        width: 140,
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
                              const urlinsta = "https://instagram.com/gerduni_";
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
                                        "@gerduni_",
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
                        height: 33,
                        constraints: const BoxConstraints(maxHeight: 33),
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
                              const urltwitter =
                                  "https://twitter.com/qidumsikesti";
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
                                        "@qidumsikesti",
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
