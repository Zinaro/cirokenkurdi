import 'package:cirokenkurdi/pages/derheq.dart';
import 'package:flutter/material.dart';

class Kelek extends StatelessWidget {
  const Kelek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 56.0),
      child: Drawer(
        backgroundColor: Colors.black12,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: CircleAvatar(
                  backgroundImage: AssetImage("assets/mamo.jpg"), radius: 100),
            ),
            Expanded(
                child: ListView(
              children: [
                const Divider(
                  height: 1.0,
                  color: Color.fromARGB(255, 150, 145, 0),
                ),
                ListTile(
                  iconColor: Colors.green,
                  textColor: Colors.green,
                  leading: const Icon(Icons.home),
                  title: const Text("Destpêk"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/destpek");
                  },
                ),
                const Divider(
                  height: 1.0,
                  color: Color.fromARGB(255, 150, 10, 0),
                ),
                ListTile(
                  iconColor: Colors.green,
                  textColor: Colors.green,
                  leading: const Icon(Icons.account_circle_rounded),
                  title: const Text("Profîla Te"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  height: 1.0,
                  color: Color.fromARGB(255, 150, 145, 0),
                ),
                ListTile(
                  iconColor: Colors.green,
                  textColor: Colors.green,
                  leading: const Icon(Icons.supervisor_account_rounded),
                  title: const Text("Hevalên Te"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  height: 1.0,
                  color: Color.fromARGB(255, 150, 10, 0),
                ),
                ListTile(
                  iconColor: Colors.green,
                  textColor: Colors.green,
                  leading: const Icon(Icons.settings),
                  title: const Text("Mîheng"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  height: 1.0,
                  color: Color.fromARGB(255, 150, 145, 0),
                ),
                ListTile(
                  iconColor: Colors.green,
                  textColor: Colors.green,
                  leading: const Icon(Icons.developer_mode),
                  title: const Text("Pêşvebir"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Derheq()),
                        (route) => false);
                  },
                ),
                const Divider(
                  height: 1.0,
                  color: Color.fromARGB(255, 150, 10, 0),
                ),
                ListTile(
                  iconColor: Colors.green,
                  textColor: Colors.green,
                  leading: const Icon(Icons.exit_to_app_rounded),
                  title: const Text("Derkeve"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(
                  height: 1.0,
                  color: Color.fromARGB(255, 150, 145, 0),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
