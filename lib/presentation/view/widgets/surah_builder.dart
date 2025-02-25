import 'package:flutter/material.dart';
import 'package:ytquran/constant.dart';
import 'single_sura_builder.dart';


class SurahBuilder extends StatefulWidget {
  final int sura;
  final List<dynamic> arabic;
  final String suraName;
  int ayah;

  SurahBuilder({
    Key? key,
    required this.sura,
    required this.arabic,
    required this.suraName,
    required this.ayah,
  }) : super(key: key);

  @override
  _SurahBuilderState createState() => _SurahBuilderState();
}

class _SurahBuilderState extends State<SurahBuilder> {
  bool view = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => jumpToAyah());
    super.initState();
  }

  void jumpToAyah() {
    if (fabIsClicked) {
      itemScrollController.scrollTo(
        index: widget.ayah,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOutCubic,
      );
    }
    fabIsClicked = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          leading: Tooltip(
            message: 'Mushaf Mode',
            child: IconButton(
              icon: const Icon(Icons.chrome_reader_mode, color: Colors.white),
              onPressed: () {
                setState(() {
                  view = !view;
                });
              },
            ),
          ),
          centerTitle: true,
          title: Text(
            widget.suraName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'quran',
              shadows: [
                Shadow(offset: Offset(1, 1), blurRadius: 2.0, color: Colors.black),
              ],
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 56, 115, 59),
        ),
        body: SingleSuraBuilder(
          arabic: widget.arabic,
          sura: widget.sura,
          ayah: widget.ayah,
          view: view,
        ),
      ),
    );
  }
}
