import 'package:cirokenkurdi/stran/biborin.dart';
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 252, 252),
      bottomNavigationBar: BottomBar(context),
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: const Center(
            child: Text(
          "Stranên Zarokan",
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
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
        child: ListView(padding: const EdgeInsets.all(5), children: const [
          SizedBox(
            height: 32,
          ),
          Biborin(),
        ]),
      ),
    );
  }
}
