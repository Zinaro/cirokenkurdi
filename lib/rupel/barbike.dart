import 'package:cirokenkurdi/widgets/buttonwidget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class BarBike extends StatefulWidget {
  const BarBike({Key? key}) : super(key: key);

  @override
  State<BarBike> createState() => _BarBikeState();
}

class _BarBikeState extends State<BarBike> {
  String title = "Rupela Barkirinê";
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        padding: const EdgeInsets.all(50),
        color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
              icon: Icons.attach_file,
              text: "Dosyayê Hilbijêre",
              onClicked: dosyaHilbijere,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "naveDosya",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 48,
            ),
            ButtonWidget(
              icon: Icons.cloud_upload,
              text: "Dosyayê Bar Bike",
              onClicked: dosyayeBarBike,
            ),
          ],
        ),
      ),
    );
  }

  void dosyaHilbijere() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path;
  }

  void dosyayeBarBike() async {
    final mountainsRef = storageRef.child("ciroks/deng/");
  }
}
