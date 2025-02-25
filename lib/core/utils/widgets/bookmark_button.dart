import 'package:flutter/material.dart';
import 'package:ytquran/constant.dart';
import 'package:ytquran/presentation/view/widgets/surah_builder.dart';

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Go to bookmark',
      child: const Icon(Icons.bookmark),
      backgroundColor: Colors.green,
      onPressed: () async {
        fabIsClicked = true;
        if (await readBookmark() == true) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SurahBuilder(
                arabic: quran[0],
                sura: bookmarkedSura - 1,
                suraName: arabicName[bookmarkedSura - 1]['name'],
                ayah: bookmarkedAyah,
              ),
            ),
          );
        }
      },
    );
  }
}
