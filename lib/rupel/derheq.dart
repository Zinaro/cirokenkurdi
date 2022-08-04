import 'package:cirokenkurdi/derheq/agahdari.dart';
import 'package:cirokenkurdi/derheq/mizgin.dart';
import 'package:cirokenkurdi/derheq/temburxwaz.dart';
import 'package:cirokenkurdi/derheq/zinar.dart';
import 'package:cirokenkurdi/widgets/bottombar.dart';
import 'package:flutter/material.dart';

class Derheq extends StatelessWidget {
  const Derheq({Key? key}) : super(key: key);

  get ad => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomBar(context),
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Center(child: Text("Derheq")),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.cyan, Colors.white],
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
