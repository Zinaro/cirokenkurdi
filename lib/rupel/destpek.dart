import 'package:cirokenkurdi/destpek/azadufasuli.dart';
import 'package:cirokenkurdi/destpek/sengeupenge.dart';
import 'package:cirokenkurdi/widgets/bottombar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:cirokenkurdi/cirok/sengeupenge.dart';
import 'package:cirokenkurdi/cirok/azadufasuli.dart';

class Destpek extends StatefulWidget {
  const Destpek({Key? key}) : super(key: key);

  @override
  State<Destpek> createState() => _DestpekState();
}

class _DestpekState extends State<Destpek> {
  ControllerenGisti controllerenGisti = Get.put(ControllerenGisti());
  int indexx = 0;
  String paszemin = "assets/sengeupenge.jpg";

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
            // image: DecorationImage(
            //     image: AssetImage(paszemin), alignment: Alignment.topCenter),
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
                        builder: (context) => const SengeuPengeCirok()));
              } else if (indexx == 1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AzaduFasuliCirok()));
              } else if (indexx == 2) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AzaduFasuli()));
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
              physics: const FixedExtentScrollPhysics(),
              itemExtent: 350,
              perspective: 0.002,
              children: const [
                SengeuPenge(),
                AzaduFasuli(),
                SengeuPenge(),
                AzaduFasuli(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
