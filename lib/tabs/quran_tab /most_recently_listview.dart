import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import '../../models/quran_resources.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';

class MostRecentlyListview extends StatelessWidget {
  final List<int> mostRecent;

  const MostRecentlyListview({super.key, this.mostRecent = const []});

  @override
  Widget build(BuildContext context) {
    if (mostRecent.isEmpty) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * .16,
        child: Center(
          child: Text(
            "There is no most recent sura",
            style: AppTextStyles.bold20grey,
          ),
        ),
      );
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height * .16,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return MostRecentlyItem(suraIndex: mostRecent[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: mostRecent.length,
      ),
    );
  }
}

class MostRecentlyItem extends StatelessWidget {
  final int suraIndex;

  const MostRecentlyItem({super.key, required this.suraIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                QuranResources.englishQuranSura[suraIndex],
                style: AppTextStyles.bold24black,
              ),
              Text(
                QuranResources.arabicQuranSura[suraIndex],
                style: AppTextStyles.bold24black,
              ),
              Text(
                "${QuranResources.ayaNumber[suraIndex]} Verses",
                style: AppTextStyles.bold14black,
              ),
            ],
          ),
          const SizedBox(width: 12),
          Image.asset(Assets.images.mostRecentImg.path),
        ],
      ),
    );
  }
}