import 'package:flutter/material.dart';
import 'package:ytquran/core/helper_function/arabic_sura_number.dart';
import 'package:ytquran/constant.dart';
import 'package:ytquran/presentation/view/widgets/surah_builder.dart';


class IndexBody extends StatelessWidget {
  final dynamic quran;

  const IndexBody({Key? key, required this.quran}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 221, 250, 236),
      child: ListView.builder(
        itemCount: 114,
        itemBuilder: (context, i) {
          return Container(
            color: i % 2 == 0
                ? const Color.fromARGB(255, 253, 247, 230)
                : const Color.fromARGB(255, 253, 251, 240),
            child: TextButton(
              child: Row(
                children: [
                  ArabicSuraNumber(i: i),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      arabicName[i]['name'],
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontFamily: 'quran',
                        shadows: [
                          Shadow(
                            offset: Offset(.5, .5),
                            blurRadius: 1.0,
                            color: Color.fromARGB(255, 130, 130, 130),
                          )
                        ],
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                fabIsClicked = false;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SurahBuilder(
                      arabic: quran[0],
                      sura: i,
                      suraName: arabicName[i]['name'],
                      ayah: 0,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}