import 'package:flutter/material.dart';

class SengeuPenge extends StatefulWidget {
  const SengeuPenge({Key? key}) : super(key: key);

  @override
  State<SengeuPenge> createState() => _SengeuPengeState();
}

class _SengeuPengeState extends State<SengeuPenge> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.green],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/ciroken-kurdi.appspot.com/o/derheq%2Fwene%2Fmizgin.jpg?alt=media&token=6a5c437d-8880-48a1-aa9a-ac5b9ff4c21d',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "assets/gulistanufirat.jpg",
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                );
              }),
            ),
            Expanded(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
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
                              colors: [Colors.cyan, Colors.white],
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          width: 140,
                          height: 60,
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
                                    width: 50,
                                    height: 50,
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
                                                    (context, error,
                                                        stackTrace) {
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
