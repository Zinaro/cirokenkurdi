import 'package:cirokenkurdi/widgets/bottombar.dart';
import 'package:flutter/material.dart';

class FavoriyenMin extends StatelessWidget {
  const FavoriyenMin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(context),
      appBar: AppBar(title: Center(child: Text("Favorîyên Min"))),
    );
  }
}
