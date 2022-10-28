import 'package:audioplayers/audioplayers.dart';
import 'package:cirokenkurdi/widgets/bottombar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoviuQuling extends StatefulWidget {
  const RoviuQuling({Key? key}) : super(key: key);

  @override
  State<RoviuQuling> createState() => _RoviuQulingState();
}

class _RoviuQulingState extends State<RoviuQuling> {
  String weneyeCiroke =
      "https://firebasestorage.googleapis.com/v0/b/cirok-kurdi.appspot.com/o/ciroks%2Fwene%2F1%2Froviuquling1.jpg?alt=media&token=5791cd2d-71b4-46b9-b6c8-50e8d026a949";
  String naveCiroke = "Rovî û Quling";
  String cirok =
      '   Rojekê quling û rovî pêrgî hev bûn. Quling ji rovî re dibêje:\n   - Heger tu bixwazî, ez dikarim te li esmanî begirînim.\n   Rovî bi vê gotinê pirr kêfxweş bû û bi dengekî bikêf lê vegerand:\n   - Ji zarokatiya xwe ve min dixwest ku ez bifirim û li asîmanî bigerim!\n   Qulingê rovî li ser baskê xwe kir û firiya. Dema bilind bû, pirsî:\n   - Dinya bi te çiqas xuya ye?\n   Rovî got:\n   - Weke gundekî.\n   Quling dîsa bilind bû û pirsî:\n   - Îcar çiqas xuya ye?\n   - Wek merşekê.\n   Quling dîsa bilind bû û dîsa pirsî:\n   - Îcar çiqas xuyaye?\n   - Dinya hew xuya ye, tiştek ne xuya ye.\n   Dibêjin wê gavê qulingê baskên xwe dan ser hev. Rovî hew dikaribû xwe bigirta û ji wê jorê de kete xwarê. Gava ku li erdê ket, derekî wî sax nema. Çend mehan di nav ciyan de ma. Piştî ku baş bû, rojekê dîsa ew û quling pêrgî hev bûn. Rovî li heyfê digeriya. Nêzîkî qulingê bû û got:\n   - Ya hevalê hêja, heger tu bixwazî ez ê te hînê reva rovî bikim.\n   Qulingê vegerand:\n   - Ez pirr dixwazim.\n   Rovî seriyek benê li serê qulingê girê da, aliyê din jî li navtenga xwe girê da û dest bi bezê kir. Dibêjin deviyek û strînek li ku hebû, quling lê qeliband. Teneyek perr û pirtik bi qulingê ve nema û laşê wê di nav birînan de ma. Bi vî awayî rovî heyfa xwe stend.';
  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
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

  Future<AudioPlayer?> setAudio() async {
    //Ji Url yê Lê Dixe//
    try {
      final storageRef = await FirebaseStorage.instance
          .ref("ciroks/deng/mizgin/roviuquling.mp3")
          .getDownloadURL();

      audioPlayer.setReleaseMode(ReleaseMode.loop);
      final url = storageRef;
      await audioPlayer.setSourceUrl(url);
      maxDuration = await audioPlayer.getDuration();

      return maxDuration != null ? audioPlayer : null;
    } catch (e) {
      const storageRef =
          "https://firebasestorage.googleapis.com/v0/b/cirok-kurdi.appspot.com/o/ciroks%2Fdeng%2Fmizgin%2Froviuquling.mp3?alt=media&token=a8507976-a214-4398-9e05-b09b514d9360";

      audioPlayer.setReleaseMode(ReleaseMode.loop);
      const url = storageRef;
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

  @override
  Widget build(BuildContext context) {
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
        future: setAudio(),
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
                    if (isPlaying) {
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
                                  weneyeCiroke,
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
                                  naveCiroke,
                                  style: GoogleFonts.rubikBubbles(
                                    color: Colors.black,
                                    fontSize: 24,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SelectableText(
                                  cirok,
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
                          const SizedBox(
                            height: 4,
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
          } else if (snapshot.hasError) {
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 125, 252, 252),
              bottomNavigationBar: BottomBar(context),
              appBar: AppBar(
                leading: IconButton(
                  color: Colors.black,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
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
                            image: const NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/cirok-kurdi.appspot.com/o/derbar%2Fwene%2Farka.jpeg?alt=media&token=73cbe2da-c730-4875-8cf2-8ab33edd3625',
                            ),
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
                                  weneyeCiroke,
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
                                  naveCiroke,
                                  style: GoogleFonts.rubikBubbles(
                                    color: Colors.black,
                                    fontSize: 24,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SelectableText(
                                  cirok,
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
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Center(child: CircularProgressIndicator()),
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
                                              MainAxisAlignment.center,
                                          children: const [
                                            Center(
                                                child:
                                                    CircularProgressIndicator()),
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
          } else {
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
                            image: const NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/cirok-kurdi.appspot.com/o/derbar%2Fwene%2Farka.jpeg?alt=media&token=73cbe2da-c730-4875-8cf2-8ab33edd3625',
                            ),
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
                                  weneyeCiroke,
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
                                  naveCiroke,
                                  style: GoogleFonts.rubikBubbles(
                                    color: Colors.black,
                                    fontSize: 24,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SelectableText(
                                  cirok,
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
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  CircularProgressIndicator(),
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
                                              MainAxisAlignment.center,
                                          children: const [
                                            CircularProgressIndicator(),
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
          }
        },
      ),
    );
  }
}
