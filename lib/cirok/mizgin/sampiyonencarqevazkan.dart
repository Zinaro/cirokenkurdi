import 'package:audioplayers/audioplayers.dart';
import 'package:cirokenkurdi/widgets/bottombar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SampiyonenCarqevazkan extends StatefulWidget {
  const SampiyonenCarqevazkan({Key? key}) : super(key: key);

  @override
  State<SampiyonenCarqevazkan> createState() => _SampiyonenCarqevazkanState();
}

class _SampiyonenCarqevazkanState extends State<SampiyonenCarqevazkan> {
  String weneyeCiroke =
      "https://firebasestorage.googleapis.com/v0/b/cirok-kurdi.appspot.com/o/ciroks%2Fwene%2F1%2Fsampiyonencarqevazkan1.png?alt=media&token=58030e36-f4ef-45e3-85c5-39cf27b7eb86";
  String naveCiroke = "Şampiyonên Çarqevazkan";
  String cirok =
      '   Kêç, kulî û beq suhbet germ kirine. Lê li ser tiştekî dikevin qirika hev. Kêç dibêje, "kes tune mîna min çarqevazkan bide." Kulî û beq vê yekê qebûl nakin. Dawiyê de dibêjin, "em ê bidine ber hev, wextê pêşbirkê ye." Qral jî vê niqaş û miqatê seh dike. Gazî wan dike, dibêje:\n   - Camêrno, bêyî xelatekî tehma pêşbirkê nîne! Ez ê keça xwe bidim yê yekemîn.\n   Kêç, kulî û beq dikin dîn bibin! Pêşî kêç dertê meydanê. Kêç têra xwe kubar e. Li doraliyê xwe dinihêre û silav dide. Li ber jinan reverans dike, yanê xwe xwar dike, silava şovalyeyan dide. Tu dibêjî qey şovalye ye! Ê, divê wisa be, ji ber ku kêç pirr li nava mirovan maye. Tiştên wisa pirr dîtine, xwe hîn kiriye.\n   Piştî kêçê kulî dertê holê. Ji kêçê qirasetir bûye. Taximek cilê kesk lê ye, pirr lê tê. Dest pê kiriye qala xwe û malbata xwe kiriye:\n   - Eslê me heta Misira qedîm diçe! Em kulî bi xwe gellek pîroz in! Pirtûkên dînî jî qala me dikin!\n   Beqê devê xwe venekiriye, bêdeng maye. Gel tev pê zanibûne ku kêfa beqê gellek ji gotina "bêdengî zêr e" re tê.\n   Her sê çûne ciyê xwe. Pey re pêşbaziyê dest pê kiriye. Kêç dîsa derketiye meydanê. Dipengize, lotika diavêje. Wisa bilind dibe, wisa bilind dibe ku kesek wê nabîne. Heta hinek ji temaşevanan dibêjin nepengiziye!\n   Kulî jî dipengize, lê şaş dipengize, diçe li çavên qralî diqelibe! Qral acis dibe, kezeba wî dike ji devê wî biavêje.\n   Dora beqê hatiye. Beq ji herduyan hindiktir pengiziye. Hema bêje negihaye nîvê wan. Lê gava ketiye erdê, şaş çûye û ketiye dawa prensesê.\n   Qral rabûye ser lingan û gotiye:\n   - Mîna texmîna we serketiyê pêşbirkê beq e! Ji ber ku ketiye dawa qîza min!\n   Bi vî awayî beqê pêşbazî kar kiriye.\n   Kêç û kulî pirr acis dibin. Lê qey dikarin tiştekî bêjin?';
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
          .ref("ciroks/deng/mizgin/sampiyonencarqevazkan.mp3")
          .getDownloadURL();

      audioPlayer.setReleaseMode(ReleaseMode.loop);
      final url = storageRef;
      await audioPlayer.setSourceUrl(url);
      maxDuration = await audioPlayer.getDuration();

      return maxDuration != null ? audioPlayer : null;
    } catch (e) {
      const storageRef =
          "https://firebasestorage.googleapis.com/v0/b/cirok-kurdi.appspot.com/o/ciroks%2Fdeng%2Fmizgin%2Fsampiyonencarqevazkan.mp3?alt=media&token=959afbd6-cb38-40b6-b67c-aeed85a5780f";

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
