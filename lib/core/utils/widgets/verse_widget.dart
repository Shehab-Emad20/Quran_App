import 'package:flutter/material.dart';
import 'package:ytquran/constant.dart';

class VerseWidget extends StatelessWidget {
  final Map<String, dynamic> verse;

  const VerseWidget({Key? key, required this.verse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      verse['aya_text'],
      textDirection: TextDirection.rtl,
      style: TextStyle(
        fontSize: arabicFontSize,
        fontFamily: arabicFont,
        color: const Color.fromARGB(196, 0, 0, 0),
      ),
    );
  }
}
