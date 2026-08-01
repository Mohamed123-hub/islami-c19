import 'package:flutter/material.dart';
import 'package:islami_c19_prod/models/sura_model.dart';
import 'package:islami_c19_prod/providers/most_recent_provider.dart';
import 'package:provider/provider.dart';

import '../../generated/assets.dart';
import '../../utils/app_routes.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/shared_pref.dart';

class SuraListWidget extends StatelessWidget {
  final List<SuraModel> filterList;
  const SuraListWidget({super.key, required this.filterList});

  @override
  Widget build(BuildContext context) {
    return filterList.isNotEmpty
        ? ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return SuraItem(suraModel: filterList[index]);
      },
      separatorBuilder: (context, index) => const Divider(
        color: Colors.white,
        thickness: 1,
        endIndent: 30,
        indent: 30,
        height: 20,
      ),
      itemCount: filterList.length,
    )
        : Text("there is no result");
  }
}

class SuraItem extends StatelessWidget {
  final SuraModel suraModel;

  const SuraItem({super.key, required this.suraModel});

  @override
  Widget build(BuildContext context) {
    final mostRecentProvider = context.read<MostRecentProvider>();
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            InkWell(
              onTap: () async {
                SharedPref.saveMostRecentlySura(suraModel.index);
                await Navigator.of(context).pushNamed(
                  AppRoutes.suraDetailsRoute,
                  arguments: SuraModel.suraList[suraModel.index],
                );
                mostRecentProvider.loadMostRecent();
              },
              child: Image.asset(
                Assets.images.suraNumImg.path,
                height: 60,
                width: 60,
                fit: BoxFit.fill,
              ),
            ),
            Text("${suraModel.index + 1}", style: AppTextStyles.bold16white),
          ],
        ),

        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(suraModel.suraEnglishName, style: AppTextStyles.bold20white),
            Text(
              "Verses ${suraModel.numOfVerses}",
              style: AppTextStyles.bold14white,
            ),
          ],
        ),
        const Spacer(),
        Text(suraModel.suraArabicName, style: AppTextStyles.bold20white),
      ],
    );
  }
}

// callback Hell
// prop Drilling