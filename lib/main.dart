import 'package:cirokenkurdi/rupel/destpek.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: kIsWeb
        ? const FirebaseOptions(
            apiKey: 'AIzaSyAoE0zJSdoLrn6WuMM8GNf1tYwVpRCw4Do',
            projectId: 'ciroken-kurdi',
            messagingSenderId: '397282647855',
            appId: '1:397282647855:android:aa1e780503cdfa766e4bda',
          )
        : const FirebaseOptions(
            apiKey: 'AIzaSyAoE0zJSdoLrn6WuMM8GNf1tYwVpRCw4Do',
            projectId: 'ciroken-kurdi',
            messagingSenderId: '397282647855',
            appId: '1:397282647855:android:aa1e780503cdfa766e4bda',
          ),
  );

  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
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
      home: const Destpek(),
      debugShowCheckedModeBanner: false,
    );
  }
}
