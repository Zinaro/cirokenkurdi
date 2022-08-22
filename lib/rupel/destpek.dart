import 'package:cirokenkurdi/cirok/deng.dart';
import 'package:cirokenkurdi/destpek/ceribandin.dart';
import 'package:cirokenkurdi/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 252, 252),
      bottomNavigationBar: BottomBar(context),
      appBar: AppBar(
        backgroundColor: Colors.white70,
        shadowColor: Colors.black,
        title: const Text(
          "Destpêk",
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
              image: const NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/ciroken-kurdi.appspot.com/o/derheq%2Fwene%2Farka.jpeg?alt=media&token=c72e89c2-b1be-4d26-a5f1-df86fe256dce'),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop),
              fit: BoxFit.cover,
              onError: (dynamic exception, StackTrace? stackTrace) {
                const AssetImage("assets/error.png");
              },
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Deng()));
              } else if (indexx == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Deng()));
              } else if (indexx == 2) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Deng()));
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
                Ceribandin(),
                Ceribandin(),
                Ceribandin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
