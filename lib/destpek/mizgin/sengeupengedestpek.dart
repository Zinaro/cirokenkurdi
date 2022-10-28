import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class SengeuPengeDestpek extends StatefulWidget {
  const SengeuPengeDestpek({Key? key}) : super(key: key);

  @override
  State<SengeuPengeDestpek> createState() => _SengeuPengeDestpekState();
}

class _SengeuPengeDestpekState extends State<SengeuPengeDestpek> {
  String navCiroke = "Şengê û Pengê";
  String agahi = "Qala bizinê û karikên wê dike.";
  bool weneheye = false;
  bool weneheye2 = false;
  String urlwene =
      "https://firebasestorage.googleapis.com/v0/b/cirok-kurdi.appspot.com/o/derbar%2Fwene%2Fmizgin.jpg?alt=media&token=a8df6c0b-2b50-49c9-984b-b22b12270479";
  String urlwene2 =
      "https://firebasestorage.googleapis.com/v0/b/cirok-kurdi.appspot.com/o/ciroks%2Fwene%2F1%2Fsengeupenge1.jpg?alt=media&token=3cef9a71-50fe-4d55-b0bd-930ac775011e";
  @override
  void initState() {
    super.initState();
    linkUrl();
    weneheye = true;
    weneheye2 = true;
  }

  // ignore: body_might_complete_normally_nullable
  Future<String?> linkUrl() async {
    try {
      final storageRef = await FirebaseStorage.instance
          .ref("derbar/wene/mizgin.jpg")
          .getDownloadURL();

      final storageRef2 = await FirebaseStorage.instance
          .ref("ciroks/wene/1/sengeupenge1.jpg")
          .getDownloadURL();

      setState(() {
        urlwene = storageRef;
        urlwene2 = storageRef2;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: -4,
              blurRadius: 7,
              offset: const Offset(0, 24), // changes position of shadow
            ),
          ],
          color: const Color.fromARGB(255, 0, 112, 112),
          image: DecorationImage(
            image: NetworkImage(urlwene2),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.9), BlendMode.dstATop),
            onError: (exception, stackTrace) =>
                const AssetImage("assets/error.png"),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        width: double.maxFinite,
        child: Column(
          children: [
            const SizedBox(height: 207, child: null),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(150, 0, 255, 255),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        height: 80,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                navCiroke,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 5, bottom: 5),
                                child: Text(
                                  agahi,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(40, 0, 0, 0),
                            Color.fromARGB(40, 0, 0, 0)
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 125,
                      height: 40,
                      child: Row(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: 35,
                                height: 35,
                                decoration: const BoxDecoration(
                                  color: Colors.redAccent,
                                  shape: BoxShape.circle,
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: weneheye
                                            ? Image.network(urlwene,
                                                fit: BoxFit.cover, errorBuilder:
                                                    (context, error,
                                                        stackTrace) {
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
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                children: const [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        "Mizgînxêr",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
