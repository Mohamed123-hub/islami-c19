import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c19_prod/generated/assets.dart';
import 'package:islami_c19_prod/models/sura_model.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {

  List<String> suraVerses = [];

  late SuraModel suraModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
          (_) => readSuraFile(suraModel.index),
    );
  }

  @override
  Widget build(BuildContext context) {
    suraModel = ModalRoute.of(context)!.settings.arguments as SuraModel;

    return Scaffold(
      backgroundColor: AppColors.darkBrown,
      appBar: AppBar(title: Text(suraModel.suraEnglishName)),
      body: Stack(
        children: [
          Image.asset(Assets.images.detailsScreenBg.path, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // SizedBox(height: 50),
                Text(
                  textAlign: TextAlign.center,
                  suraModel.suraArabicName,
                  style: AppTextStyles.bold24primary,
                ),
                SizedBox(height: 60),

                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Visibility(
                        visible: suraVerses.isNotEmpty,
                        replacement: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,

                          TextSpan(
                            children: [
                              for (int i = 0; i < suraVerses.length; i++) ...[
                                TextSpan(
                                  text: suraVerses[i],
                                  style: AppTextStyles.bold24primary,
                                ),
                                TextSpan(
                                  text: "[${i + 1}],",
                                  style: AppTextStyles.bold20grey,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  readSuraFile(int index) async {
    String suraContent = await rootBundle.loadString(
      "assets/files/sura/${index + 1}.txt",
    );
    setState(() {
      suraVerses = suraContent.trim().split("\n");
    });
    print(suraContent);
  }
}

List<int> ages1 = [1, 2, 3, 4];
List<int> ages2 = [5, 6, 965, 65, 6];

///Future = Promise