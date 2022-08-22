import 'package:cirokenkurdi/derheq/agahdari.dart';
import 'package:cirokenkurdi/derheq/mizgin.dart';
import 'package:cirokenkurdi/derheq/temburxwaz.dart';
import 'package:cirokenkurdi/derheq/zinar.dart';
import 'package:cirokenkurdi/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Derheq extends StatelessWidget {
  const Derheq({Key? key}) : super(key: key);

  get ad => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomBar(context),
        appBar: AppBar(
          backgroundColor: Colors.red.shade900,
          title: const Center(
              child: Text(
            "Derheq",
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
          // ignore: prefer_const_literals_to_create_immutables
          child: ListView(padding: const EdgeInsets.all(5), children: const [
            Agahdari(),
            Zinar(),
            Mizgin(),
            Temburxwaz(),
          ]),
        ),
      ),
    );
  }
}
