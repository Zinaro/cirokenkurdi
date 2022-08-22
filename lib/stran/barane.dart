import 'package:cirokenkurdi/stran/rupel/barane.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Barane extends StatefulWidget {
  const Barane({Key? key}) : super(key: key);

  @override
  State<Barane> createState() => _BaraneState();
}

class _BaraneState extends State<Barane> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BaraneRupel()));
      },
      child: Container(
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: SizedBox(
                    width: 75,
                    height: 75,
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
                const Icon(FontAwesomeIcons.arrowRight)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
