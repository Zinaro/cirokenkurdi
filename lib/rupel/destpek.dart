import 'package:cirokenkurdi/destpek/dengbejmizgin.dart';
import 'package:cirokenkurdi/destpek/rupelamizgin.dart';
import 'package:cirokenkurdi/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Destpek extends StatefulWidget {
  const Destpek({Key? key}) : super(key: key);

  @override
  State<Destpek> createState() => _DestpekState();
}

class _DestpekState extends State<Destpek> {
  ControllerenGisti controllerenGisti = Get.put(ControllerenGisti());
  int indexx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 252, 252),
      bottomNavigationBar: BottomBar(context),
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
                Column(
                  children: [
                    const SizedBox(height: 25),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.white30, Colors.white30],
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                                shape: BoxShape.rectangle,
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: -4,
                                      blurRadius: 8,
                                      color: Colors.black.withOpacity(0.5),
                                      offset: const Offset(0, 6))
                                ]),
                            child: const Center(
                                child: Text("Dengbêj Hilbijêre",
                                    style: TextStyle(
                                      fontSize: 32,
                                    ))),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            height: 300,
                            child: ListView(
                              padding: const EdgeInsets.only(bottom: 22),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const RupelaMizgin()));
                                      },
                                      child: SizedBox(
                                        height: 300,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.90,
                                        child: const DengbejMizgin(),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const RupelaMizgin()));
                                      },
                                      child: SizedBox(
                                        height: 300,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.90,
                                        child: const DengbejMizgin(),
                                      ),
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
              ],
            )),
      ),
    );
  }
}
