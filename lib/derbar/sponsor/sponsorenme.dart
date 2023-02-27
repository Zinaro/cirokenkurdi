// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../widgets/bottombar.dart';
import '../kes.dart';

class SponsorenMe extends StatefulWidget {
  List sponsorList;
  SponsorenMe({Key? key, required this.sponsorList}) : super(key: key);

  @override
  State<SponsorenMe> createState() => _SponsorenMeState();
}

class _SponsorenMeState extends State<SponsorenMe> {
  @override
  Widget build(BuildContext context) {
    CollectionReference sponsorcoll =
        FirebaseFirestore.instance.collection("sponsors");
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
          "Sponsorên Me",
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
      body: Container(
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
        // ignore: prefer_const_literals_to_create_immutables
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: widget.sponsorList.length,
          itemBuilder: (ctx, index) {
            return FutureBuilder<DocumentSnapshot>(
                future: sponsorcoll.doc(widget.sponsorList[index]).get(),
                builder: (contxt, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return Kes(
                      kesNav: data['sponsorNav'],
                      kesBio: data['sponsorBio'],
                      kesWene: data['sponsorWene'],
                      kesTwitter: data['sponsorTwitter'],
                      kesInstagram: data['sponsorInstagram'],
                      kesMalper: data['sponsorMalper'],
                      kesYoutube: data['sponsorYoutube'],
                      kesMail: data['sponsorMail'],
                      kesZayend: data['sponsorZayend'],
                      kesNavnas: data['sponsorNavnas'],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                });
          },
          padding: const EdgeInsets.all(5),
        ),
      ),
    );
  }
}
