import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Zinar extends StatefulWidget {
  const Zinar({Key? key}) : super(key: key);

  @override
  State<Zinar> createState() => _ZinarState();
}

class _ZinarState extends State<Zinar> {
  bool weneheye = false;
  String urlwene =
      "https://pbs.twimg.com/profile_images/1542080501523046400/7E2nVfmd_400x400.jpg";
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
          .ref("derheq/wene/zinar.jpg")
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
                                      child: weneheye
                                          ? Image.network(urlwene,
                                              fit: BoxFit.cover, errorBuilder:
                                                  (context, error, stackTrace) {
                                              return Image.asset(
                                                  "assets/firat.jpg");
                                            })
                                          : Image.asset("assets/firat.jpg"),
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
                                  'Îslam Zinar',
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          width: 140,
                          height: 35,
                          constraints: const BoxConstraints(
                              maxHeight: 50, maxWidth: 140),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white,
                                  Color.fromARGB(255, 68, 67, 67)
                                ],
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
                                const urlinsta = "https://github.com/Zinaro";
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
                                      FontAwesomeIcons.github,
                                      color: Colors.blue,
                                      size: 24,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Text(
                                          "@Zinaro",
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
                                const urltwitter =
                                    "https://twitter.com/Zinarcim";
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
                                          "@Zinarcim",
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
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 200,
                          height: 35,
                          constraints: const BoxConstraints(maxHeight: 50),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.white, Colors.yellow],
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
                              onTap: () {
                                Clipboard.setData(const ClipboardData(
                                    text: "islamzinar@gmail.com"));
                                snackbarNisanBide(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Row(
                                  children: const [
                                    Icon(
                                      FontAwesomeIcons.envelope,
                                      color: Colors.blue,
                                      size: 24,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Text(
                                          "islamzinar@gmail.com",
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void snackbarNisanBide(BuildContext context) {
    const snackBar = SnackBar(
      content: Text(
        "E-Peyam hat kopîkirin.",
        style: TextStyle(fontSize: 24, color: Colors.black),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 3),
      shape: StadiumBorder(),
      margin: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
