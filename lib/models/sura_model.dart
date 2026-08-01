import 'package:islami_c19_prod/models/quran_resources.dart';

class SuraModel {
  String suraEnglishName;
  String suraArabicName;
  String numOfVerses;
  int index;

  SuraModel({
    required this.suraArabicName,
    required this.numOfVerses,
    required this.suraEnglishName,
    required this.index,
  });

  static List<SuraModel> suraList = List.generate(
    114,
        (index) => SuraModel(
      suraArabicName: QuranResources.arabicQuranSura[index],
      numOfVerses: QuranResources.ayaNumber[index],
      suraEnglishName: QuranResources.englishQuranSura[index],
      index: index,
    ),
  );
}