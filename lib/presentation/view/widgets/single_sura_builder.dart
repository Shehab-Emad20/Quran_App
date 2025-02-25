import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:ytquran/constant.dart';
import 'package:ytquran/core/utils/widgets/return_basmala.dart';
import 'package:ytquran/core/utils/widgets/verse_widget.dart';

class SingleSuraBuilder extends StatelessWidget {
  final List<dynamic> arabic;
  final int sura;
  final int ayah;
  final bool view;

  SingleSuraBuilder({
    Key? key,
    required this.arabic,
    required this.sura,
    required this.ayah,
    required this.view,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int lengthOfSura = noOfVerses[sura];
    int previousVerses = 0;

    if (sura + 1 != 1) {
      for (int i = sura - 1; i >= 0; i--) {
        previousVerses += noOfVerses[i];
      }
    }

    return SafeArea(
      child: Container(
        color: const Color.fromARGB(255, 253, 251, 240),
        child: view
            ? ScrollablePositionedList.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      (index != 0) || (sura == 0) || (sura == 8)
                          ? const SizedBox.shrink()
                          : const BasmalaWidget(),
                      Container(
                        color: index % 2 != 0
                            ? const Color.fromARGB(255, 253, 251, 240)
                            : const Color.fromARGB(255, 253, 247, 230),
                        child: PopupMenuButton(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: VerseWidget(
                                verse: arabic[index + previousVerses]),
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              onTap: () {
                                saveBookMark(sura + 1, index);
                              },
                              child: const ListTile(
                                leading: Icon(Icons.bookmark_add,
                                    color: Color.fromARGB(255, 56, 115, 59)),
                                title: Text('Bookmark'),
                              ),
                            ),
                            PopupMenuItem(
                              child: const ListTile(
                                leading: Icon(Icons.share,
                                    color: Color.fromARGB(255, 56, 115, 59)),
                                title: Text('Share'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                itemCount: lengthOfSura,
              )
            : Center(
                child: Text(
                  arabic
                      .sublist(previousVerses, previousVerses + lengthOfSura)
                      .map((e) => e['aya_text'])
                      .join(" "),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: mushafFontSize,
                    fontFamily: arabicFont,
                    color: const Color.fromARGB(196, 44, 44, 44),
                  ),
                ),
              ),
      ),
    );
  }
}
