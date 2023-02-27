import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';

class SepanNoNet extends StatelessWidget {
  const SepanNoNet({super.key});
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(150, 0, 255, 255),
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 125, 252, 252),
        appBar: AppBar(
          backgroundColor: Colors.white70,
          shadowColor: Colors.black,
          title: const Text(
            "Destpêk",
            style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
          ),
          centerTitle: true,
          elevation: 20.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            //BorderRadius.only
          ),
        ),
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/bg.jpeg'),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop),
              fit: BoxFit.cover,
            ),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 125, 252, 252),
                Color.fromARGB(255, 125, 253, 253),
              ],
            ),
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 250,
              ),
              Container(
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
                                child: Text("Biborin",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ))),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: const [
                                    Expanded(
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 4,
                                              right: 4,
                                              bottom: 4,
                                              top: 14),
                                          child: Text(
                                            "Înternet tuneye. Ji kerema xwe re înternetê vekin. Piştê we înternet vekir sepanê ji nû ve dest pê bikin.",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 50,
                                margin: const EdgeInsets.only(
                                  right: 75,
                                  left: 75,
                                ),
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
                                        borderRadius:
                                            BorderRadius.circular(30)),
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
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: InkWell(
                                                  onTap: () {
                                                    Restart.restartApp();
                                                  },
                                                  child: Row(
                                                    children: const [
                                                      Expanded(
                                                        child: Center(
                                                          child: Text(
                                                            "Ji Nû Ve!",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                      CircularProgressIndicator.adaptive(strokeWidth: 1,)
                                                    ],
                                                  ),
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
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
