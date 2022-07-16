// ignore_for_file: deprecated_member_use

import 'package:audioplayers/audioplayers.dart';
import 'package:cirokenkurdi/widgets/bottombar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AzaduFasuliCirok extends StatefulWidget {
  const AzaduFasuliCirok({Key? key}) : super(key: key);

  @override
  State<AzaduFasuliCirok> createState() => _AzaduFasuliCirokState();
}

class _AzaduFasuliCirokState extends State<AzaduFasuliCirok> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isRepeat = true;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  late Duration? maxDuration;

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerComplete.listen((event) {
      isPlaying = false;
    });
    audioPlayer.onPlayerStateChanged.listen(
      (state) {
        setState(
          () {
            isPlaying = (state == PlayerState.playing);
          },
        );
      },
    );
    audioPlayer.onDurationChanged.listen(
      (newDuration) {
        setState(
          () {
            duration = newDuration;
          },
        );
      },
    );
    audioPlayer.onPositionChanged.listen(
      (newPosition) {
        setState(
          () {
            position = newPosition;
          },
        );
      },
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<AudioPlayer?> setAudio() async {
    try {
      final storageRef = await FirebaseStorage.instance
          .ref("ciroks/deng/azad.aac")
          .getDownloadURL();
      audioPlayer.setReleaseMode(ReleaseMode.release);
      final url = storageRef;
      await audioPlayer.setSourceUrl(url);
      maxDuration = await audioPlayer.getDuration();

      return maxDuration != null ? audioPlayer : null;
    } catch (e) {
      rethrow;
    }

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
      child: FutureBuilder<AudioPlayer?>(
        future: setAudio(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
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

                      snapshot.data!.stop();
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
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Image.network(
                          "https://www.antraktsinema.com/images/pimages/201004/vizyon1_1270467038.jpg",
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              "assets/error.png",
                              width: 100,
                              height: 100,
                            );
                          },
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
                        await snapshot.data!.seek(position);
                        await snapshot.data!.resume();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text((position)
                                .toString()
                                .split('.')
                                .first
                                .padLeft(8, "0")),
                            Text((duration)
                                .toString()
                                .split('.')
                                .first
                                .padLeft(8, "0")),
                          ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          child: IconButton(
                            icon: Icon(
                                isRepeat ? Icons.repeat_one : Icons.repeat),
                            iconSize: 50,
                            onPressed: () async {
                              if (isRepeat) {
                                snapshot.data!.setReleaseMode(ReleaseMode.loop);
                              }
                            },
                          ),
                        ),
                        CircleAvatar(
                          radius: 35,
                          child: IconButton(
                            icon: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow),
                            iconSize: 50,
                            onPressed: () async {
                              if (isPlaying) {
                                await snapshot.data!.pause();
                              } else {
                                await snapshot.data!.resume();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                leading: IconButton(
                  color: Colors.red,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ),
              bottomNavigationBar: BottomBar(context),
              backgroundColor: Colors.transparent,
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                leading: IconButton(
                  color: Colors.red,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ),
              bottomNavigationBar: BottomBar(context),
              backgroundColor: Colors.transparent,
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
