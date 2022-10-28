import 'package:cirokenkurdi/stran/dinya.dart';
import "package:flutter/material.dart";
import 'package:cirokenkurdi/widgets/bottombar.dart';

class Stran extends StatefulWidget {
  const Stran({Key? key}) : super(key: key);

  @override
  State<Stran> createState() => _StranState();
}

class _StranState extends State<Stran> {
  late int _hejmar = 0;
  late int a = 0;
  void zedeBike() {
    setState(() {
      _hejmar++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (a == 0) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 125, 252, 252),
        bottomNavigationBar: BottomBar(context),
        appBar: AppBar(
          backgroundColor: Colors.white70,
          title: const Center(
              child: Text(
            "Stranên Zarokan",
            style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
          )),
          centerTitle: true,
          elevation: 20.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            //BorderRadius.only
          ),
        ),
        body: Container(
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
          child: ListView(padding: const EdgeInsets.all(5), children: [
            const SizedBox(
              height: 32,
            ),
            SizedBox(
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
                                            "   Biborin zarokno, niha stran tuneye.",
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
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 100,
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
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            a = 1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  "De Baş e.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Transform.rotate(
                      angle: _hejmar * 0.3,
                      child: Image.asset("assets/panda.png"),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 6,
          onPressed: () {
            zedeBike();
          },
          child: const Icon(Icons.autorenew),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 125, 252, 252),
        bottomNavigationBar: BottomBar(context),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                a = 0;
              });
            },
          ),
          backgroundColor: Colors.white70,
          title: const Text(
            "Dinyayê Bigerîne",
            style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: const Dinya(),
      );
    }
  }
}
