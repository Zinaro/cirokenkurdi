import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class Dinya extends StatefulWidget {
  const Dinya({Key? key}) : super(key: key);

  @override
  State<Dinya> createState() => _DinyaState();
}

class _DinyaState extends State<Dinya> {
  late Object? dinya;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dinya = Object(fileName: "assets/dinya/earth.obj");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/back.png"), fit: BoxFit.cover)),
      child: Center(child: Cube(
        onSceneCreated: (Scene scene) {
          scene.world.add(dinya!);
          scene.camera.zoom = 5;
        },
      )),
    );
  }
}
