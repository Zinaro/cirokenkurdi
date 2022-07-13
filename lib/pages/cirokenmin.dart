import 'package:cirokenkurdi/pages/rupelaciroke.dart';
import 'package:cirokenkurdi/widgets/bottombar.dart';
import 'package:cirokenkurdi/widgets/buttonwidget.dart';
import 'package:flutter/material.dart';

class CirokenMin extends StatelessWidget {
  const CirokenMin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(context),
      appBar: AppBar(title: const Text("Çirokên Min")),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Center(
          child: ButtonWidget(
            icon: Icons.attach_file,
            text: "Dosyayê Hilbijêre",
            onClicked: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CirokeVeke()));
            },
          ),
        ),
      ),
    );
  }
}
