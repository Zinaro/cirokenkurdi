// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Alikari extends StatefulWidget {
  const Alikari({
    Key? key,
  }) : super(key: key);

  @override
  State<Alikari> createState() => _AlikariState();
}

class _AlikariState extends State<Alikari> {
  late InterstitialAd _interstitialAd5;
  bool _isAdLoaded5 = false;
  void _initAd5() {
    InterstitialAd.load(
        adUnitId: "ca-app-pub-5740747068187975/4868768749",
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: onAdLoaded5, onAdFailedToLoad: (error) {}));
  }
  late InterstitialAd _interstitialAd30;
  bool _isAdLoaded30 = false;
  void _initAd30() {
    InterstitialAd.load(
        adUnitId: "ca-app-pub-5740747068187975/7854484185",
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: onAdLoaded30, onAdFailedToLoad: (error) {}));
  }
  @override
  void initState() {
    _initAd5();
    _initAd30();
    super.initState();
  }
  void onAdLoaded5(InterstitialAd ad) {
    _interstitialAd5 = ad;
    
    setState(() {
      _isAdLoaded5 = true;
    });
  }
  void onAdLoaded30(InterstitialAd ad) {
    _interstitialAd30 = ad;
    
    setState(() {
      _isAdLoaded30 = true;
    });
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
                        child: Text("Reklam",
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
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.only(left: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 4, right: 4, bottom: 4),
                              child: SelectableText(
                                "   Ji bo alîkariyê hûn dikarin reklaman temaşe bikin. Mecbûrî nîne.",
                                style: GoogleFonts.oswald(
                                    fontSize: 14, color: Colors.black87),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
                      width: 150,
                      height: 50,
                      constraints: const BoxConstraints(maxHeight: 50),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [_isAdLoaded5 ? Colors.lightGreenAccent: Colors.green, _isAdLoaded5 ? Colors.lightGreenAccent: Colors.green],
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
                            if (_isAdLoaded5) {
                              _interstitialAd5.show();
                              _initAd5();
                            } else {
                              snackbarNisanBide(context);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.gift,
                                  color: _isAdLoaded5 ? Colors.blueAccent: Colors.redAccent,
                                  size: 24,
                                ),
                                const Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      "Reklama 5 çirke",
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
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
                      width: 150,
                      height: 50,
                      constraints: const BoxConstraints(maxHeight: 50),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [_isAdLoaded30 ? Colors.lightGreenAccent: Colors.green, _isAdLoaded30 ? Colors.lightGreenAccent: Colors.green],
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
                            if (_isAdLoaded30) {
                              _interstitialAd30.show();
                              _initAd30();
                            } else {
                              snackbarNisanBide(context);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.gift,
                                  color: _isAdLoaded30 ? Colors.blueAccent: Colors.redAccent,
                                  size: 24,
                                ),
                                const Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      "Reklama 30 çirke",
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
                const SizedBox(height: 10,)
              ],
            ),
          ],
        ),
      ),
    );
  }
  void snackbarNisanBide(BuildContext context) {
    const snackBar = SnackBar(
      content: Text(
        "Niha Reklam Bar Nebûye.",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Color.fromARGB(181, 0, 0, 0),
      duration: Duration(seconds: 1),
      shape: StadiumBorder(),
      margin: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
