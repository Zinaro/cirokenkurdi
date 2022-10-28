import 'package:cirokenkurdi/cirok/mizgin/bukututuk.dart';
import 'package:cirokenkurdi/cirok/mizgin/lawiketiral.dart';
import 'package:cirokenkurdi/cirok/mizgin/mihugur.dart';
import 'package:cirokenkurdi/cirok/mizgin/roviuquling.dart';
import 'package:cirokenkurdi/cirok/mizgin/sampiyonencarqevazkan.dart';
import 'package:cirokenkurdi/cirok/mizgin/sengeupenge.dart';
import 'package:cirokenkurdi/cirok/mizgin/seremihe.dart';
import 'package:cirokenkurdi/cirok/mizgin/serumisk.dart';
import 'package:cirokenkurdi/destpek/mizgin/bukututukdestpek.dart';
import 'package:cirokenkurdi/destpek/mizgin/lawiketiraldestpek.dart';
import 'package:cirokenkurdi/destpek/mizgin/roviuqulingdestpek.dart';
import 'package:cirokenkurdi/destpek/mizgin/sampiyonencarqevazkandestpek.dart';
import 'package:cirokenkurdi/destpek/mizgin/sengeupengedestpek.dart';
import 'package:cirokenkurdi/destpek/mizgin/mihugurdestpek.dart';
import 'package:cirokenkurdi/destpek/mizgin/seremihedestpek.dart';
import 'package:cirokenkurdi/destpek/mizgin/serumiskdestpek.dart';
import 'package:cirokenkurdi/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RupelaMizgin extends StatefulWidget {
  const RupelaMizgin({Key? key}) : super(key: key);

  @override
  State<RupelaMizgin> createState() => _RupelaMizginState();
}

class _RupelaMizginState extends State<RupelaMizgin> {
  ControllerenGisti controllerenGisti = Get.put(ControllerenGisti());
  int indexx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 252, 252),
      bottomNavigationBar: BottomBar(context),
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        iconTheme: IconTheme.of(context),
        backgroundColor: Colors.white70,
        shadowColor: Colors.black,
        title: const Text(
          "Dengê Mizgînê",
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
          child: InkWell(
            onTap: () {
              if (indexx == 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SengeuPenge()));
              } else if (indexx == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const BukuTutuk()));
              } else if (indexx == 2) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LawikeTiral()));
              } else if (indexx == 3) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SeruMisk()));
              } else if (indexx == 4) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RoviuQuling()));
              } else if (indexx == 5) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MihuGur()));
              } else if (indexx == 6) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SampiyonenCarqevazkan()));
              } else if (indexx == 7) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SereMihe()));
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
                } else if (index == 3) {
                  indexx = index;
                } else if (index == 4) {
                  indexx = index;
                } else if (index == 5) {
                  indexx = index;
                } else if (index == 6) {
                  indexx = index;
                } else if (index == 7) {
                  indexx = index;
                }
              },
              physics: const FixedExtentScrollPhysics(),
              itemExtent: 280,
              perspective: 0.002,
              children: const [
                /*indexx = 0 */
                SengeuPengeDestpek(),
                /*indexx = 1 */
                BukuTutukDestpek(),
                /*indexx = 2 */
                LawikeTiralDestpek(),
                /*indexx = 3 */
                SeruMiskDestpek(),
                /*indexx = 4 */
                RoviuQulingDestpek(),
                /*indexx = 5 */
                MihuGurDestpek(),
                /*indexx = 6 */
                SampiyonenCarqevazkanDestpek(),
                /*indexx = 7 */
                SereMiheDestpek(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
