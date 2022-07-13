import 'package:cirokenkurdi/derheq/mizgin.dart';
import 'package:cirokenkurdi/derheq/zinar.dart';
import 'package:cirokenkurdi/widgets/bottombar.dart';
import 'package:cirokenkurdi/widgets/buttonwidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Derheq extends StatelessWidget {
  const Derheq({Key? key}) : super(key: key);

  get ad => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomBar(context),
        appBar: AppBar(
          title: Center(child: const Text("Derheq")),
          centerTitle: true,
          actions: [
            Container(
                margin: EdgeInsets.only(right: 15, bottom: 5),
                child: IconButton(
                    iconSize: 40,
                    color: Colors.black,
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.medal,
                      color: Colors.white,
                    )))
          ],
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
          child: ListView(padding: const EdgeInsets.all(5), children: [
            const Zinar(),
            const Mizgin(),
            const Zinar(),
            const Mizgin(),
          ]),
        ),
      ),
    );
  }
}
