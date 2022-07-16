import 'package:cirokenkurdi/rupel/derheq.dart';
import 'package:cirokenkurdi/rupel/destpek.dart';

import 'package:cirokenkurdi/rupel/stran.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
Widget BottomBar(BuildContext context) {
  ControllerenGisti controllerenme = Get.find<ControllerenGisti>();
  return Obx(() => ConvexAppBar(
        style: TabStyle.flip,
        items: const [
          TabItem(icon: Icons.music_note_rounded, title: 'Stran'),
          TabItem(icon: Icons.home, title: 'Destpêk'),
          TabItem(icon: Icons.developer_mode, title: 'Derheq'),
        ],
        initialActiveIndex:
            controllerenme.kijanmenu.value, //optional, default as 0
        onTap: (int i) => {
          if (i == 0)
            {
              controllerenme.kijanmenu.value = i,
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Stran()),
                  (route) => false)
            }
          else if (i == 1)
            {
              controllerenme.kijanmenu.value = i,
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Destpek()),
                  (route) => false)
            }
          else if (i == 2)
            {
              controllerenme.kijanmenu.value = i,
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Derheq()),
                  (route) => false)
            }
        },
      ));
}

class ControllerenGisti extends GetxController {
  RxInt kijanmenu = 1.obs;
}
