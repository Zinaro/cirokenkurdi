import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Barane extends StatefulWidget {
  const Barane({Key? key}) : super(key: key);

  @override
  State<Barane> createState() => _BaraneState();
}

class _BaraneState extends State<Barane> {
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
          .ref("stran/deng/ZarokTV-BaraneGuje.opus")
          .getDownloadURL();
      audioPlayer.setReleaseMode(ReleaseMode.release);
      final url = storageRef;
      await audioPlayer.setSourceUrl(url);
      maxDuration = await audioPlayer.getDuration();

      return maxDuration != null ? audioPlayer : null;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.cyanAccent, Colors.yellowAccent],
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: FutureBuilder<AudioPlayer?>(
        future: setAudio(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://firebasestorage.googleapis.com/v0/b/ciroken-kurdi.appspot.com/o/stran%2Fwene%2Fzaroktv-baraneguje.jpg?alt=media&token=d8fab0ee-ceb3-4fb1-b1f5-aa2f19746780',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text((position)
                              .toString()
                              .split('.')
                              .first
                              .padLeft(8, "0")),
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
                          Text((duration)
                              .toString()
                              .split('.')
                              .first
                              .padLeft(8, "0")),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Text(
                                  "Zarok TV",
                                  style: TextStyle(fontSize: 25),
                                )
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: const [
                                Text(
                                  "Baranê Guj e",
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 35,
                        child: IconButton(
                          icon:
                              Icon(isPlaying ? Icons.pause : Icons.play_arrow),
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
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
