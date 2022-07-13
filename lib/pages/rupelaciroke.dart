// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:cirokenkurdi/widgets/bottombar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CirokeVeke extends StatefulWidget {
  const CirokeVeke({Key? key}) : super(key: key);

  @override
  State<CirokeVeke> createState() => _CirokeVekeState();
}

class _CirokeVekeState extends State<CirokeVeke> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    final storageRef = await FirebaseStorage.instance
        .ref("ciroks/deng/azad.aac")
        .getDownloadURL();

    //Ji Telefonê Lê Dixe//
    // final result = await FilePicker.platform.pickFiles();
    // if (result != null) {
    //   final file = File(result.files.single.path!);
    //   audioPlayer.setSourceUrl(file.path);
    // }

    //Ji Dosyayên Nava Sepanê de Lê Dixe//
    //final player = AudioCache(prefix: "assets/");
    //final url = await player.load("kurdistan.mp3");
    //audioPlayer.setSourceUrl(url.path);

    //Ji Url yê Lê Dixe//

    audioPlayer.setReleaseMode(ReleaseMode.loop);
    final url = storageRef.toString();
    await audioPlayer.setSourceUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.cyan, Colors.white],
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: BottomBar(context),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            color: Colors.red,
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              if (isPlaying) {
                // showDialog(
                //   context: context,
                //   builder: (context) => AlertDialog(
                //     title: const Text("Bibore"),
                //     content: const Text("Dixwazî bila çîrok di paş de lêkeve?"),
                //     actions: [
                //       FlatButton(
                //           onPressed: () {
                //             audioPlayer.pause();
                //             Navigator.pop(context);
                //           },
                //           child: const Text("NA")),
                //       FlatButton(
                //           onPressed: () {
                //             Navigator.pop(context);
                //           },
                //           child: const Text("ERÊ"))
                //     ],
                //   ),
                // );

                audioPlayer.stop();
              }

              Navigator.pop(context);
            },
            // onPressed: () => showDialog(
            //   context: context,
            //   builder: (context) => AlertDialog(
            //     title: const Text("Bibore"),
            //     content: const Text("Dixwazî bila çîrok di paş de lêkeve?"),
            //     actions: [
            //       FlatButton(
            //           onPressed: () {
            //             if(isPlaying){

            //             }
            //             Navigator.of(context).pop();
            //           },
            //           child: const Text("NA"))
            //     ],
            //   ),
            // ),
          ),
          iconTheme: IconTheme.of(context),
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Azad û Fasûliya Bi Sihir",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Image.network(
                  "https://www.dlf.pt/dfpng/maxpng/363-3635426_yellow-ball-png.png",
                  width: double.infinity,
                  height: 320,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Azad û Fasûliya Bi Sihir",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              "Ji Dengê Mizgînê",
              style: TextStyle(fontSize: 20),
            ),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await audioPlayer.seek(position);
                await audioPlayer.resume();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        (position).toString().split('.').first.padLeft(8, "0")),
                    Text(
                        (duration).toString().split('.').first.padLeft(8, "0")),
                  ]),
            ),
            CircleAvatar(
              radius: 35,
              child: IconButton(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                iconSize: 50,
                onPressed: () async {
                  if (isPlaying) {
                    await audioPlayer.pause();
                  } else {
                    await audioPlayer.resume();
                  }
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}


//
//colors: [
//              Colors.greenAccent,
//              Color.fromARGB(255, 0, 255, 0),
//              Color.fromARGB(255, 255, 0, 0),
//              Color.fromARGB(255, 255, 255, 0),
//              Colors.yellowAccent
//            ],
