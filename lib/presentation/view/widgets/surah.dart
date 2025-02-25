import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:ytquran/constant.dart';
import 'package:ytquran/presentation/view/widgets/surah_view.dart';

class SurahBuilder extends StatefulWidget {
  final int sura;
  final List arabic;
  final String suraName;
  final int ayah;

  const SurahBuilder({
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
  bool viewMode = true;
  final ItemScrollController _scrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _jumpToAyah());
  }

  void _jumpToAyah() {
    _scrollController.scrollTo(
      index: widget.ayah,
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    int lengthOfSura = noOfVerses[widget.sura];

    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.chrome_reader_mode, color: Colors.white),
            tooltip: 'Mushaf Mode',
            onPressed: () {
              setState(() {
                viewMode = !viewMode;
              });
            },
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
                Shadow(
                  offset: Offset(1, 1),
                  blurRadius: 2.0,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 56, 115, 59),
        ),
        body: SurahView(
          viewMode: viewMode,
          arabic: widget.arabic,
          sura: widget.sura,
          scrollController: _scrollController,
        ),
      ),
    );
  }
}