import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tartan/utils/text_widget.dart';

Widget Tilesax({
  required BuildContext context,
  required String title,
  required String subtitle,
  required Widget leading,
  required Widget trailing,
  required Widget navigateTo,
}) {
  return ListTile(
    title: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Textsax(
          text: title, fontSize: 17, fontWeight: FontWeight.w700, height: 1.3),
    ),
    subtitle: Textsax(text: subtitle, fontSize: 13),
    leading: leading,
    trailing: trailing,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    tileColor: Colors.white,
    onTap: () {
      Get.to(navigateTo);
    },
    contentPadding: const EdgeInsets.all(15),
  );
}

Widget Tilesm({
  required BuildContext context,
  required String title,
  required IconData leading,
  required Widget navigateTo,
}) {
  return ListTile(
    onTap: () {
      Get.to(navigateTo);
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    title: Textsax(text: title, fontSize: 18),
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        leading,
      ),
    ),
    contentPadding: const EdgeInsets.all(5),
  );
}
