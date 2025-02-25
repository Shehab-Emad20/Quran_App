import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    title: const Text(
      "Quran",
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            offset: Offset(1, 1),
            blurRadius: 2.0,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ],
      ),
    ),
    backgroundColor: const Color.fromARGB(255, 56, 115, 59),
  );
}