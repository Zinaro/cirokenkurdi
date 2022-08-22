import 'package:cirokenkurdi/stran/barane.dart';
import 'package:cirokenkurdi/stran/berxemin.dart';
import 'package:cirokenkurdi/stran/dikodiko.dart';
import 'package:cirokenkurdi/stran/gundeme.dart';
import 'package:cirokenkurdi/stran/keleso.dart';
import 'package:cirokenkurdi/stran/kivroske.dart';
import 'package:cirokenkurdi/stran/leylo.dart';
import 'package:cirokenkurdi/stran/lyly.dart';
import 'package:cirokenkurdi/stran/yekyeke.dart';
import 'package:cirokenkurdi/widgets/bottombar.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class Stran extends StatefulWidget {
  const Stran({Key? key}) : super(key: key);

  @override
  State<Stran> createState() => _StranState();
}

class _StranState extends State<Stran> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomBar(context),
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: const Center(
            child: Text(
          "Stranên Zarokan",
          style: TextStyle(fontWeight: FontWeight.w900),
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
        decoration: const BoxDecoration(
          // image: DecorationImage(
          //     image: AssetImage(paszemin), alignment: Alignment.topCenter),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
              Color.fromARGB(255, 255, 230, 0),
              Color.fromARGB(255, 255, 230, 0),
              Color.fromARGB(255, 255, 230, 0),
              Colors.white,
              Colors.white
            ],
          ),
        ),
        child: ListView(padding: const EdgeInsets.all(5), children: const [
          Barane(), Barane(), Barane(), Barane(), Barane(), Barane(), Barane(),
          Barane(), Barane(),
          // DikoDiko(),
          // GundeMe(),
          // Kivroske(),
          // YekYeke(),
          // Leylo(),
          // Keleso(),
          // LyLy(),
          // BerxeMin(),
        ]),
      ),
    ));
  }
}
