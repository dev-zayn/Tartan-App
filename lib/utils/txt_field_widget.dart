import 'package:flutter/material.dart';
import 'package:tartan/utils/colours.dart';

Widget txtFormField(
    {required String hint,
    required IconData prefixIcon,
    required TextInputType textInputType,
    required TextInputAction textInputAction,
    required TextEditingController controller}) {
  return TextField(
    controller: controller,
    textInputAction: textInputAction,
    keyboardType: textInputType,
    style: TextStyle(
      fontSize: 18,
    ),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        fontSize: 18,
      ),
      prefixIcon: Icon(
        prefixIcon,
        color: Colurs.lightGreen,
      ),
      filled: true,
      fillColor: Colurs.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
    ),
  );
}
