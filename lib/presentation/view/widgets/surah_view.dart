import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:ytquran/constant.dart';
import 'package:ytquran/core/utils/widgets/return_basmala.dart';
import 'package:ytquran/presentation/view/widgets/verse_builder.dart';

class SurahView extends StatelessWidget {
  final bool viewMode;
  final List arabic;
  final int sura;
  final ItemScrollController scrollController;

  const SurahView({
    Key? key,
    required this.viewMode,
    required this.arabic,
    required this.sura,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int previousVerses = _calculatePreviousVerses();
    int lengthOfSura = noOfVerses[sura];

    return SafeArea(
      child: Container(
        color: const Color.fromARGB(255, 253, 251, 240),
        child: viewMode
            ? ScrollablePositionedList.builder(
                itemCount: lengthOfSura,
                itemScrollController: scrollController,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      if (index == 0 && sura != 0 && sura != 8)
                        const BasmalaWidget(),
                      VerseBuilder(
                        verseText: arabic[index + previousVerses]['aya_text'],
                        index: index,
                        sura: sura,
                      ),
                    ],
                  );
                },
              )
            : _mushafMode(previousVerses),
      ),
    );
  }

  int _calculatePreviousVerses() {
    int previousVerses = 0;
    if (sura > 0) {
      for (int i = 0; i < sura; i++) {
        previousVerses += noOfVerses[i];
      }
    }
    return previousVerses;
  }

  Widget _mushafMode(int previousVerses) {
    String fullSura = "";
    for (int i = 0; i < noOfVerses[sura]; i++) {
      fullSura += arabic[i + previousVerses]['aya_text'];
    }

    return ListView(
      children: [
        if (sura != 0 && sura != 8) const BasmalaWidget(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            fullSura,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: mushafFontSize,
              fontFamily: arabicFont,
              color: const Color.fromARGB(196, 44, 44, 44),
            ),
          ),
        ),
      ],
    );
  }
}
