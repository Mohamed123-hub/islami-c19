import 'package:flutter/material.dart';
import 'package:islami_c19_prod/providers/most_recent_provider.dart';
import 'package:provider/provider.dart';

import '../../generated/assets.dart';
import '../../models/sura_model.dart';
import '../../utils/app_text_styles.dart';
import 'most_recently_listview.dart';
import 'search_field_widget.dart';
import 'sura_list_widget.dart';

class QuranTabContent extends StatefulWidget {
  const QuranTabContent({super.key});

  @override
  State<QuranTabContent> createState() => _QuranTabContentState();
}

class _QuranTabContentState extends State<QuranTabContent> {
  late MostRecentProvider mostRecentProvider;
  List<SuraModel> filterList = [];

  @override
  void initState() {
    // TODO: implement initState
    filterList = SuraModel.suraList;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
          (_) => mostRecentProvider.loadMostRecent(),
    );
  }

  onChanged(String text) {
    filterList = SuraModel.suraList.where((sura) {
      return sura.suraArabicName.contains(text) ||
          sura.suraEnglishName.contains(text);
    }).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // mostRecentProvider = context.watch<MostRecentProvider>();
    mostRecentProvider = Provider.of(context, listen: true);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height * .02,
        children: [
          Center(child: Image.asset(Assets.images.headerImg.path)),
          SearchField(onChanged: onChanged),
          Text("Most Recently", style: AppTextStyles.bold16white),
          MostRecentlyListview(mostRecent: mostRecentProvider.mostRecent),
          Text("Suras List", style: AppTextStyles.bold16white),
          Expanded(child: SuraListWidget(filterList: filterList)),
        ],
      ),
    );
  }
}

//finish most recently
// State management
// filter search
// read hadeeth details

/// heap
/// stack
/// garbage collector
/// momory allocation
///