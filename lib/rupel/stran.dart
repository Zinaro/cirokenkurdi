import 'package:cirokenkurdi/stran/dipirsin.dart';
import 'package:cirokenkurdi/stran/gundeme.dart';
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
        title: const Center(child: Text("Stranên Zarokan")),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.yellow, Colors.cyan],
          ),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        child: ListView(padding: const EdgeInsets.all(5), children: [
          const GundeMe(),
          const Dipirsin(),
          const GundeMe(),
          const Dipirsin(),
        ]),
      ),
    ));
  }
}
