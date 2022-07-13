import 'package:cirokenkurdi/widgets/bottombar.dart';
import 'package:flutter/material.dart';

class CirokenGeleri extends StatelessWidget {
  const CirokenGeleri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(context),
      appBar: AppBar(title: const Text("Çîrokên Gelêrî")),
    );
  }
}
