import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

double arabicFontSize = 20.0;
double mushafFontSize = 25.0;
String arabicFont = 'quran';

List<int> noOfVerses = [7, 286, 200, 176]; // Example values
bool fabIsClicked = false;

final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();

void saveBookMark(int sura, int ayah) {
  // Bookmark saving logic
}

const String quranAppUrl =
    'https://play.google.com/store/apps/details?id=com.example.quranapp';
