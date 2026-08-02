import 'package:flutter/material.dart';
import 'package:islami_c19_prod/generated/assets.dart';
import 'package:islami_c19_prod/models/tab_info.dart';
import 'package:islami_c19_prod/utils/app_colors.dart';

import '../tabs/quran_tab /quran_tab_content.dart';

import '../tabs/radio_tabs/radio_tab.dart';
import '../tabs/sebha_tabs/sebha_tab.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;

  List<TabInfo> tabs = [
    TabInfo(
      iconPath: Assets.images.quranIc.path,
      backgroundImage: Assets.images.backHomeImage.path,
      content: const QuranTabContent(),
      label: "Quran",
    ),

    TabInfo(
      iconPath: Assets.images.hadeethIc.path,
      backgroundImage: Assets.images.backHomeImage.path,
      content: Container(),
      label: "Hadeeth",
    ),

    TabInfo(
      iconPath: Assets.images.sebhaIc.path,
      backgroundImage: "",
      content: const SebhaTab(),
      label: "Sebha",
    ),

    TabInfo(
      iconPath: Assets.images.radioIc.path,
      backgroundImage: Assets.images.backHomeImage.path,
      content: const RadioTab(),
      label: "Radio",
    ),

    TabInfo(
      iconPath: Assets.images.timeIc.path,
      backgroundImage: Assets.images.backHomeImage.path,
      content: Container(),
      label: "Time",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedIndex: selectedIndex,
        backgroundColor: AppColors.primary,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        indicatorColor: AppColors.darkBrown.withValues(alpha: .6),
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(color: Colors.white),
        ),
        destinations: List.generate(
          tabs.length,
          (index) => NavigationDestination(
            icon: ImageIcon(AssetImage(tabs[index].iconPath)),
            label: tabs[index].label,
            selectedIcon: ImageIcon(
              AssetImage(tabs[index].iconPath),
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          if (tabs[selectedIndex].backgroundImage.isNotEmpty)
            Image.asset(
              tabs[selectedIndex].backgroundImage,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          tabs[selectedIndex].content,
        ],
      ),
    );
  }
}
