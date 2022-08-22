import 'package:cirokenkurdi/derbar/agahdari.dart';
import 'package:cirokenkurdi/derbar/ceren.dart';
import 'package:cirokenkurdi/derbar/mizgin.dart';
import 'package:cirokenkurdi/derbar/temburxwaz.dart';
import 'package:cirokenkurdi/derbar/zinar.dart';
import 'package:cirokenkurdi/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Derheq extends StatelessWidget {
  const Derheq({Key? key}) : super(key: key);

  get ad => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 252, 252),
      bottomNavigationBar: BottomBar(context),
      appBar: AppBar(
        backgroundColor: Colors.white70,
        shadowColor: Colors.black,
        title: const Text(
          "Derbar",
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.star_border),
            onPressed: () async {
              const urlplaystore =
                  "https://play.google.com/store/apps/details?id=com.cirokenkurdi.cirokenkurdi";
              if (await canLaunchUrlString(urlplaystore)) {
                await launchUrlString(
                  urlplaystore,
                  mode: LaunchMode.externalApplication,
                );
              }
            },
            tooltip: "Parve Bike",
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.share),
              onPressed: () {
                Share.share(
                    "Merheba şekirê min. Tu jî sepana 'Çîrokên Kurdî' daxîne û çîrokan bi zimadê xwe guhdar bike.\n\nAndroid Lînk: https://play.google.com/store/apps/details?id=com.cirokenkurdi.cirokenkurdi\n\nIOS Link: Android bikar bîne.");
              },
              tooltip: "Parve Bike",
            ),
          ),
        ],
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
        // ignore: prefer_const_literals_to_create_immutables
        child: ListView(padding: const EdgeInsets.all(5), children: const [
          SizedBox(
            height: 20,
          ),
          Agahdari(),
          SizedBox(
            height: 20,
          ),
          Zinar(),
          SizedBox(
            height: 20,
          ),
          Mizgin(),
          SizedBox(
            height: 20,
          ),
          Ceren(),
          SizedBox(
            height: 20,
          ),
          Temburxwaz(),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
