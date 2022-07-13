import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/destpek.dart';
import 'package:cirokenkurdi/widgets/netcontrol.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 0, 246, 21),
      ),
      home: Destpek(),
      debugShowCheckedModeBanner: false,
    );
  }
}
