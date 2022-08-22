import 'package:cirokenkurdi/destpek/azadufasuli.dart';
import 'package:cirokenkurdi/destpek/sengeupenge.dart';
import 'package:cirokenkurdi/widgets/bottombar.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomBar(context),
        appBar: AppBar(
          backgroundColor: Colors.red.shade900,
          title: const Text(
            "Destpêk",
            style: TextStyle(
                fontWeight: FontWeight.w900, color: Colors.yellowAccent),
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
      ),
    );
  }
}
