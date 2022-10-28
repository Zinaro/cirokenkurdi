import 'package:audioplayers/audioplayers.dart';
import 'package:cirokenkurdi/widgets/bottombar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeruMisk extends StatefulWidget {
  const SeruMisk({Key? key}) : super(key: key);

  @override
  State<SeruMisk> createState() => _SeruMiskState();
}

class _SeruMiskState extends State<SeruMisk> {
  String weneyeCiroke =
      "https://firebasestorage.googleapis.com/v0/b/cirok-kurdi.appspot.com/o/ciroks%2Fwene%2F1%2Fserumisk1.jpg?alt=media&token=ccfe2f88-9771-4dca-90d0-b84346a47d54";
  String naveCiroke = "Şêr û Mişk";
  String cirok =
      '   Mişka reben li daristanê di nava tirsê de dijiya. Ji rovî ditirsiya, ji gurî dibizdiya û jixwe gava çav bi pisîka kovî diket, ziravê wê diqetiya. Tu dev ji van jî berde, gava gulîkek bişkesta mişk ji tirsana difirriya.\n   Mişk bala xwe didê ku wisa nabe. Bi vê tirsê jiyan dewam nake. Radibe diçe cem qralê daristanê, yanî cem şêrî, dibêje:\n   - Mirêsdar, qralê camêr; her çiqas ne heddê min be jî tikayeke, yanê ricayeke min ji we heye. Di vê daristanê de ajala herî reben ez im. Çi qeder, çi qeder! Jiyana min di nava tirs û lerzê de didome. Pelek bikeve, çokên min dişikên. Êdî ez nikarim bi vê tirsê bijîm. Ne pêkan e ez tehemmul bikim. Tu qralê vê daristanê yî. Tu tiştekî nakî jî, bi gurmijîna te gel tev diferihe, ditirse. Tu dikarî min biparêzî. Tu li vê şikefta mezin dijî. Helbet ciyê min jî li cem te heye. Ez te qet aciz nakim. Deng ji min dernayê. Ez ê li aliyekî şikeftê rûnêm. Tu qet pê dernaxî ka ez heme an tuneme.\n   Şêr bêdeng guhdarî dike. Rebena mişkê dibêje qey bêdengî pejirandin, yanê qebûlkirin e. Dibê ka piçekî din jî tika bikim, ew ê bipejirîne:\n   - Ez dizanim ku ne layiqê vê qenciyê me. Lê kî dizane? Ger çiqas biçûk û bêfeyde xuya bikim jî, belkî rojekê qenciya min jî bigihîje te. Hingê ez ê jî deynê xwe bidim!\n   Şêr aciz dibe, dîn dibe, tor dibe. Çavê wî sor dibin:\n   - Mişka beredayî! Keçê tu xwe çi dihesibînî? Dê qralekî mîna min çawa hewceyê te bibe? Here ji vir hê ku min te nekuştî! Heta dawiya emrê xwe jî ji min re dua bike ku min bi nahpêlûşkê xwe te perçe perçe nekiriye!\n   Rebena mişkê bi wê tirsê wisa dibeze, wisa dibeze ku di nava çend deqîqeyan de ji daristanê derdikeve. Ji xwe re qulekê dibîne û bi mehan serê xwe ji qulê dernaxe.\n   Şêr jî çend roj bi vê bêterbiyehiya mişkê aciz dibe, paşî ji bîr dike. Rojekê birçî dibe, diçe nêçîrê. Lê li ser rêya wî dafikek hebûye. Hema bêhemdê xwe ketiye dafikê. Lê ew şêr e, çawa ji dafikan bitirse? Hewî dide ku rabe, lê çiqas dilebite ben û werîs dora wî zexmtir dipêçin. Nêçîrvanan bi ben û werîsan toreke wisa çêkirine ku xilasbûn jê tune. Şêr bara rojê hewl dide, lê gava roj diçe ber ava, êdî radiweste, bêhêvî dibe. Pey re mişk tê bîra wî. Dibêje:\n   - Ax serê min ê bêaqil, ax! Ger ku min mişkê ji xwe nexeyidanda dê ezê ji vê dafikê xilas bikirama. Dê bi diranên xwe yên tûj ben û werîs bibirriya! Lê ew ne li vir e! Û ez ê bimirim! Ku min ew biçûk nedîta ez nedimirim. Nexwe her kesek li goreya xwe karekî pêk tîne!';
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
          .ref("ciroks/deng/mizgin/serumisk.mp3")
          .getDownloadURL();

      audioPlayer.setReleaseMode(ReleaseMode.loop);
      final url = storageRef;
      await audioPlayer.setSourceUrl(url);
      maxDuration = await audioPlayer.getDuration();

      return maxDuration != null ? audioPlayer : null;
    } catch (e) {
      const storageRef =
          "https://firebasestorage.googleapis.com/v0/b/cirok-kurdi.appspot.com/o/ciroks%2Fdeng%2Fmizgin%2Fserumisk.mp3?alt=media&token=f3bc3a63-8f88-47ef-bcee-8eade80ceb61";

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
