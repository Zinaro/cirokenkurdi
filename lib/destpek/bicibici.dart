import 'package:flutter/material.dart';

class BiciBici extends StatefulWidget {
  const BiciBici({Key? key}) : super(key: key);

  @override
  State<BiciBici> createState() => _BiciBiciState();
}

class _BiciBiciState extends State<BiciBici> {
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
                offset: const Offset(0, 16), // changes position of shadow
              ),
            ],
            color: Colors.black,
            image: DecorationImage(
              image: const NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/ciroken-kurdi.appspot.com/o/ciroks%2Fwene%2Fbicibici.jpg?alt=media&token=830f2b1f-a442-4ba9-b339-ddc875f7ad60'),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.9), BlendMode.dstATop),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          width: double.maxFinite,
          child: Column(
            children: [
              const SizedBox(height: 280, child: null),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(150, 0, 255, 255),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          height: 80,
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  "Şengê û Pengê",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 5, left: 10, right: 5, bottom: 5),
                                  child: Text(
                                    "Qala bizin û karikên wê dike",
                                    style: TextStyle(
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
                                          child: Image.network(
                                              'https://firebasestorage.googleapis.com/v0/b/ciroken-kurdi.appspot.com/o/derheq%2Fwene%2Fmizgin.jpg?alt=media&token=6a5c437d-8880-48a1-aa9a-ac5b9ff4c21d',
                                              fit: BoxFit.cover, errorBuilder:
                                                  (context, error, stackTrace) {
                                            return Image.asset(
                                              "assets/gulistan.jpg",
                                              fit: BoxFit.cover,
                                            );
                                          }),
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
            ],
          )),
    );
  }
}
