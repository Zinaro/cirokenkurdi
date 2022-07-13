import 'package:cirokenkurdi/destpek/azadufasuli.dart';
import 'package:cirokenkurdi/pages/derheq.dart';
import 'package:cirokenkurdi/widgets/bottombar.dart';
import 'package:cirokenkurdi/widgets/buttonwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:cirokenkurdi/pages/rupelaciroke.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class Destpek extends StatefulWidget {
  const Destpek({Key? key}) : super(key: key);

  @override
  State<Destpek> createState() => _DestpekState();
}

class _DestpekState extends State<Destpek> {
  ControllerenGisti controllerenGisti = Get.put(ControllerenGisti());
  TextEditingController n1 = TextEditingController();
  TextEditingController n2 = TextEditingController();
  TextEditingController n3 = TextEditingController();

  var nivisaSernav = "";
  var nivisaLink = "";
  var nivisaWene = "";

  int indexx = 0;

  @override
  void canim() async {
    final storageRef = await FirebaseStorage.instance
        .ref("ciroks/deng/kurdistan.mp3")
        .getDownloadURL();
    print(storageRef.toString());
  }

  nivisNuBike() {
    FirebaseFirestore.instance
        .collection("ciroks")
        .doc(n1.text)
        .set({"link": n2.text, "nav": n1.text, "wene": n3.text});
  }

  nivisNujenBike() {
    FirebaseFirestore.instance
        .collection("ciroks")
        .doc()
        .update({"link": n2.text, "nav": n1.text, "wene": n3.text});
  }

  nivisBine() {
    FirebaseFirestore.instance
        .collection("ciroks")
        .doc(n1.text)
        .get()
        .then((datayakuHat) {
      setState(() {
        nivisaSernav = datayakuHat.data()!["nav"];
        nivisaLink = datayakuHat.data()!["link"];
        nivisaWene = datayakuHat.data()!["wene"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(context),
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.menu_open_sharp),
        //   onPressed: () {
        //     _scaffold.currentState?.openDrawer();
        //   },
        //   tooltip: "Menûyê Veke",
        // ),
        title: const Text(
          "Destpêk",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              Share.share(
                  "Merheba şekirê min. Tu jî sepana 'Çîrokên Kurdî' daxîne û çîrokan bi zarokan bide guhdarkirin. Lînk:");
            },
            tooltip: "Parve Bike",
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.cyan, Colors.white],
            ),
          ),
          child: InkWell(
            onTap: () {
              if (indexx == 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CirokeVeke()));
              } else if (indexx == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Derheq()));
              } else if (indexx == 2) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CirokeVeke()));
              }
            },
            child: ListWheelScrollView(
                onSelectedItemChanged: (index) {
                  if (index == 0) {
                    indexx = index;
                  } else if (index == 1) {
                    indexx = index;
                  } else if (index == 2) {
                    indexx = index;
                  }
                },
                physics: FixedExtentScrollPhysics(),
                itemExtent: 350,
                perspective: 0.004,
                offAxisFraction: -0.6,
                useMagnifier: true,
                children: [
                  AzadMizgin(),
                  AzadMizgin(),
                  AzadMizgin(),
                  AzadMizgin(),
                  AzadMizgin(),
                  AzadMizgin(),
                  AzadMizgin(),
                  AzadMizgin(),
                ]),
          ),
        ),
      ),
    );
  }
}
