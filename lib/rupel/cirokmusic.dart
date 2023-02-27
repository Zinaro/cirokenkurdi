// ignore_for_file: must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../widgets/bottombar.dart';

class CirokMusic extends StatefulWidget {
  String cirokNav;
  String cirokNavber;
  String cirokUrl;
  String cirokWene;
  CirokMusic({
    Key? key,
    required this.cirokNav,
    required this.cirokNavber,
    required this.cirokUrl,
    required this.cirokWene,
  }) : super(key: key);
  @override
  State<CirokMusic> createState() => _CirokMusicState();
}

class _CirokMusicState extends State<CirokMusic> {
  late String weneyeCiroke;
  late String naveCiroke;
  late String cirok;
  late String musicCirok;
  late String car = widget.cirokNav;

  @override
  void dispose() {
    audioPlayer.dispose();
    audioPlayerEffect1.dispose();
    audioPlayerEffect2.dispose();
    audioPlayerEffect3.dispose();
    super.dispose();
  }

  final audioPlayer = AudioPlayer();
  final audioPlayerEffect1 = AudioPlayer();
  final audioPlayerEffect2 = AudioPlayer();
  final audioPlayerEffect3 = AudioPlayer();
  bool isPlaying = false;
  bool isPlayingEffect1 = false;
  bool isPlayingEffect2 = false;
  bool isPlayingEffect3 = false;
  double defaultValue = 0.2;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  late Duration? maxDuration;

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerComplete.listen((event) {
      isPlaying = false;
    });
    audioPlayerEffect1.onPlayerComplete.listen((event) {
      isPlayingEffect1 = false;
    });
    audioPlayerEffect2.onPlayerComplete.listen((event) {
      isPlayingEffect2 = false;
    });
    audioPlayerEffect3.onPlayerComplete.listen((event) {
      isPlayingEffect3 = false;
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
    audioPlayerEffect1.onPlayerStateChanged.listen(
      (state) {
        setState(
          () {
            if (audioPlayerEffect2.state == PlayerState.playing ||
                audioPlayerEffect3.state == PlayerState.playing) {
              audioPlayerEffect2.pause();
              audioPlayerEffect3.pause();
            }
            isPlayingEffect1 = (state == PlayerState.playing);
            audioPlayerEffect1.setVolume(defaultValue);
          },
        );
      },
    );
    audioPlayerEffect2.onPlayerStateChanged.listen(
      (state) {
        setState(
          () {
            if (audioPlayerEffect1.state == PlayerState.playing ||
                audioPlayerEffect3.state == PlayerState.playing) {
              audioPlayerEffect1.pause();
              audioPlayerEffect3.pause();
            }
            isPlayingEffect2 = (state == PlayerState.playing);
            audioPlayerEffect2.setVolume(defaultValue);
          },
        );
      },
    );
    audioPlayerEffect3.onPlayerStateChanged.listen(
      (state) {
        setState(
          () {
            if (audioPlayerEffect1.state == PlayerState.playing ||
                audioPlayerEffect2.state == PlayerState.playing) {
              audioPlayerEffect1.pause();
              audioPlayerEffect2.pause();
            }
            isPlayingEffect3 = (state == PlayerState.playing);
            audioPlayerEffect3.setVolume(defaultValue);
          },
        );
      },
    );
  }

  Future<AudioPlayer?> setAudio(musicCirok) async {
    //Ji Url yê Lê Dixe//
    try {
      // final storageRef = await FirebaseStorage.instance
      //     .ref("ciroks/deng/effect/effect1.mp3")
      //     .getDownloadURL();
      //final effect = storageRef;
      final url = musicCirok;
      audioPlayer.setReleaseMode(ReleaseMode.loop);
      await audioPlayer.setSourceUrl(url);
      //await audioPlayer.setSourceUrl(effect);
      maxDuration = await audioPlayer.getDuration();
      return maxDuration != null ? audioPlayer : null;
    } catch (e) {
      final url = musicCirok;
      audioPlayer.setReleaseMode(ReleaseMode.loop);
      await audioPlayer.setSourceUrl(url);
      maxDuration = await audioPlayer.getDuration();
      return maxDuration != null ? audioPlayer : null;
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
  }

  Future<AudioPlayer?> setAudioEffect1() async {
    //Ji Url yê Lê Dixe//
    try {
      final storageRef = await FirebaseStorage.instance
          .ref("ciroks/deng/effect/effect1.mp3")
          .getDownloadURL();
      final effect = storageRef;
      audioPlayerEffect1.setReleaseMode(ReleaseMode.loop);
      await audioPlayerEffect1.setSourceUrl(effect);
      return maxDuration != null ? audioPlayerEffect1 : null;
    } catch (e) {
      return null;
    }
  }

  Future<AudioPlayer?> setAudioEffect2() async {
    try {
      final storageRef = await FirebaseStorage.instance
          .ref("ciroks/deng/effect/effect2.mp3")
          .getDownloadURL();
      final effect = storageRef;
      audioPlayerEffect2.setReleaseMode(ReleaseMode.loop);
      await audioPlayerEffect2.setSourceUrl(effect);
      return maxDuration != null ? audioPlayerEffect2 : null;
    } catch (e) {
      return null;
    }
  }

  Future<AudioPlayer?> setAudioEffect3() async {
    try {
      final storageRef = await FirebaseStorage.instance
          .ref("ciroks/deng/effect/effect3.mp3")
          .getDownloadURL();
      final effect = storageRef;
      audioPlayerEffect3.setReleaseMode(ReleaseMode.loop);
      await audioPlayerEffect3.setSourceUrl(effect);
      return maxDuration != null ? audioPlayerEffect3 : null;
    } catch (e) {
      return null;
    }
  }



  @override
  Widget build(BuildContext context) {
    setState(() {
      naveCiroke = widget.cirokNav;
      cirok = widget.cirokNavber;
      musicCirok = widget.cirokUrl;
      weneyeCiroke = widget.cirokWene;
    });
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 125, 252, 252),
            Color.fromARGB(255, 125, 253, 253),
          ],
        ),
      ),
      child: FutureBuilder<AudioPlayer?>(
        future: setAudio(musicCirok),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 125, 252, 252),
              bottomNavigationBar: BottomBar(context),
              appBar: AppBar(
                leading: IconButton(
                  color: Colors.black,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () async {
                    if (isPlaying ||
                        isPlayingEffect1 ||
                        isPlayingEffect2 ||
                        isPlayingEffect3) {
                      audioPlayerEffect1.stop();
                      audioPlayerEffect2.stop();
                      audioPlayerEffect3.stop();
                      snapshot.data!.stop();
                    }
                    Navigator.pop(context);
                  },
                ),
                iconTheme: IconTheme.of(context),
                shadowColor: Colors.black,
                backgroundColor: Colors.white70,
                title: Text(
                  naveCiroke,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
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
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 125, 252, 252),
                      Color.fromARGB(255, 125, 253, 253),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage('assets/bg.jpeg'),
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.1),
                                BlendMode.dstATop),
                            fit: BoxFit.cover,
                            onError:
                                (dynamic exception, StackTrace? stackTrace) {
                              const AssetImage("assets/error.png");
                            },
                          ),
                        ),
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            const SizedBox(
                              height: 14,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: const Color.fromARGB(255, 0, 112, 112),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: -10,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 30) // changes position of shadow
                                      ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.network(
                                  widget.cirokWene,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      "assets/error.png",
                                    );
                                  },
                                  width: double.infinity,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              child: Column(children: [
                                Text(
                                  widget.cirokNav,
                                  style: GoogleFonts.rubikBubbles(
                                    color: Colors.black,
                                    fontSize: 24,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SelectableText(
                                  widget.cirokNavber.replaceAll(r'\n', '\n'),
                                  style: GoogleFonts.lora(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //! Effect 1
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "Av",
                                    style: GoogleFonts.lora(
                                      fontSize: 13,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Center(
                                    child: FutureBuilder<AudioPlayer?>(
                                        future: setAudioEffect1(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return Row(
                                              children: [
                                                if (isPlayingEffect1)
                                                  IconButton(
                                                    onPressed: () async {
                                                      if (defaultValue > 0) {
                                                        defaultValue =
                                                            defaultValue - 0.1;
                                                        if (defaultValue <= 0) {
                                                          defaultValue = 0.1;
                                                        }
                                                      }
                                                      await snapshot.data!
                                                          .setVolume(
                                                              defaultValue);
                                                    },
                                                    icon: const Icon(
                                                        Icons.remove),
                                                  ),
                                                IconButton(
                                                  icon: Icon(isPlayingEffect1
                                                      ? Icons.volume_up
                                                      : Icons.volume_off),
                                                  onPressed: () async {
                                                    if (isPlayingEffect1) {
                                                      await snapshot.data!
                                                          .pause();
                                                    } else {
                                                      await snapshot.data!
                                                          .resume();
                                                    }
                                                  },
                                                ),
                                                if (isPlayingEffect1)
                                                  IconButton(
                                                    onPressed: () async {
                                                      if (defaultValue < 1) {
                                                        defaultValue =
                                                            defaultValue + 0.1;
                                                        if (defaultValue > 1) {
                                                          defaultValue = 1;
                                                        }
                                                      }
                                                      await snapshot.data!
                                                          .setVolume(
                                                              defaultValue);
                                                    },
                                                    icon: const Icon(Icons.add),
                                                  ),
                                              ],
                                            );
                                          } else {
                                            return const Center();
                                          }
                                        }),
                                  ),
                                ],
                              ),
                              // ! Effect 2
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "Bilûr",
                                    style: GoogleFonts.lora(
                                      fontSize: 13,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Center(
                                    child: FutureBuilder<AudioPlayer?>(
                                        future: setAudioEffect2(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return Row(
                                              children: [
                                                if (isPlayingEffect2)
                                                  IconButton(
                                                    onPressed: () async {
                                                      if (defaultValue > 0) {
                                                        defaultValue =
                                                            defaultValue - 0.1;
                                                        if (defaultValue <= 0) {
                                                          defaultValue = 0.1;
                                                        }
                                                      }
                                                      await snapshot.data!
                                                          .setVolume(
                                                              defaultValue);
                                                    },
                                                    icon: const Icon(
                                                        Icons.remove),
                                                  ),
                                                IconButton(
                                                  icon: Icon(isPlayingEffect2
                                                      ? Icons.volume_up
                                                      : Icons.volume_off),
                                                  onPressed: () async {
                                                    if (isPlayingEffect2) {
                                                      await snapshot.data!
                                                          .pause();
                                                    } else {
                                                      await snapshot.data!
                                                          .resume();
                                                    }
                                                  },
                                                ),
                                                if (isPlayingEffect2)
                                                  IconButton(
                                                    onPressed: () async {
                                                      if (defaultValue < 1) {
                                                        defaultValue =
                                                            defaultValue + 0.1;
                                                        if (defaultValue > 1) {
                                                          defaultValue = 1;
                                                        }
                                                      }
                                                      await snapshot.data!
                                                          .setVolume(
                                                              defaultValue);
                                                    },
                                                    icon: const Icon(Icons.add),
                                                  ),
                                              ],
                                            );
                                          } else {
                                            return const Center();
                                          }
                                        }),
                                  ),
                                ],
                              ),
                              // !Effect 3
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "Piano",
                                    style: GoogleFonts.lora(
                                      fontSize: 13,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Center(
                                    child: FutureBuilder<AudioPlayer?>(
                                        future: setAudioEffect3(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return Row(
                                              children: [
                                                if (isPlayingEffect3)
                                                  IconButton(
                                                    onPressed: () async {
                                                      if (defaultValue > 0.1) {
                                                        defaultValue =
                                                            defaultValue - 0.1;
                                                        if (defaultValue <
                                                            0.1) {
                                                          defaultValue = 0.1;
                                                        }
                                                      }
                                                      await snapshot.data!
                                                          .setVolume(
                                                              defaultValue);
                                                    },
                                                    icon: const Icon(
                                                        Icons.remove),
                                                  ),
                                                IconButton(
                                                  icon: Icon(isPlayingEffect3
                                                      ? Icons.volume_up
                                                      : Icons.volume_off),
                                                  onPressed: () async {
                                                    if (isPlayingEffect3) {
                                                      await snapshot.data!
                                                          .pause();
                                                    } else {
                                                      await snapshot.data!
                                                          .resume();
                                                    }
                                                  },
                                                ),
                                                if (isPlayingEffect3)
                                                  IconButton(
                                                    onPressed: () async {
                                                      if (defaultValue < 0.9) {
                                                        defaultValue =
                                                            defaultValue + 0.1;
                                                        if (defaultValue > 1) {
                                                          defaultValue = 1;
                                                        }
                                                      }
                                                      await snapshot.data!
                                                          .setVolume(
                                                              defaultValue);
                                                    },
                                                    icon: const Icon(Icons.add),
                                                  ),
                                              ],
                                            );
                                          } else {
                                            return const Center();
                                          }
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text((position)
                                      .toString()
                                      .split('.')
                                      .first
                                      .padLeft(8, "0")),
                                  Container(
                                    margin: const EdgeInsets.all(6),
                                    height: 32,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Slider(
                                      min: 0,
                                      max: duration.inSeconds.toDouble(),
                                      value: position.inSeconds.toDouble(),
                                      onChanged: (value) async {
                                        final position =
                                            Duration(seconds: value.toInt());
                                        await snapshot.data!.seek(position);
                                        await snapshot.data!.resume();
                                      },
                                    ),
                                  ),
                                  Text((duration)
                                      .toString()
                                      .split('.')
                                      .first
                                      .padLeft(8, "0")),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.green,
                                                shape: BoxShape.circle,
                                              ),
                                              width: 55,
                                              height: 55,
                                              child: IconButton(
                                                icon: Icon(isPlaying
                                                    ? Icons.pause
                                                    : Icons.play_arrow),
                                                iconSize: 40,
                                                onPressed: () async {
                                                  if (isPlaying) {
                                                    await snapshot.data!
                                                        .pause();
                                                  } else {
                                                    await snapshot.data!
                                                        .resume();
                                                  }
                                                },
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }  else {
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 125, 252, 252),
              bottomNavigationBar: BottomBar(context),
              appBar: AppBar(
                iconTheme: IconTheme.of(context),
                shadowColor: Colors.black,
                backgroundColor: Colors.white70,
                title: const Text(
                  "Bar Dibe",
                  style:  TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
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
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 125, 252, 252),
                      Color.fromARGB(255, 125, 253, 253),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage('assets/bg.jpeg'),
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.1),
                                BlendMode.dstATop),
                            fit: BoxFit.cover,
                            onError:
                                (dynamic exception, StackTrace? stackTrace) {
                              const AssetImage("assets/error.png");
                            },
                          ),
                        ),
                        child: const Center(child: CircularProgressIndicator(),)
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
