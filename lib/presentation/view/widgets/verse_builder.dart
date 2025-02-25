import 'package:flutter/material.dart';
import 'package:ytquran/constant.dart';

class VerseBuilder extends StatelessWidget {
  final String verseText;
  final int index;
  final int sura;

  const VerseBuilder({
    Key? key,
    required this.verseText,
    required this.index,
    required this.sura,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index % 2 == 0
          ? const Color.fromARGB(255, 253, 251, 240)
          : const Color.fromARGB(255, 253, 247, 230),
      child: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            onTap: () {
              saveBookMark(sura + 1, index);
            },
            child: _menuItem(Icons.bookmark_add, 'Bookmark'),
          ),
          PopupMenuItem(
            onTap: () {},
            child: _menuItem(Icons.share, 'Share'),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            verseText,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: arabicFontSize,
              fontFamily: arabicFont,
              color: const Color.fromARGB(196, 0, 0, 0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuItem(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: const Color.fromARGB(255, 56, 115, 59)),
        const SizedBox(width: 10),
        Text(title),
      ],
    );
  }
}
