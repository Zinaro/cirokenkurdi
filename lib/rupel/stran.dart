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
        backgroundColor: Colors.red,
        title: const Center(child: Text("Stranên Zarokan")),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.indigo, Colors.white],
          ),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        child: ListView(padding: const EdgeInsets.all(5), children: const [
          DikoDiko(),
          GundeMe(),
          Kivroske(),
          YekYeke(),
          Leylo(),
          Barane(),
          Keleso(),
          LyLy(),
          BerxeMin(),
        ]),
      ),
    ));
  }
}
