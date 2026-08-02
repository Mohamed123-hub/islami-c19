import 'package:flutter/material.dart';
import 'package:islami_c19_prod/providers/most_recent_provider.dart';
import 'package:islami_c19_prod/providers/sebha_provider.dart';
import 'package:islami_c19_prod/screens/main_layout.dart';
import 'package:islami_c19_prod/screens/sura_details_screen.dart';
import 'package:islami_c19_prod/screens/onboarding/onboarding_screen.dart';
import 'package:islami_c19_prod/utils/app_colors.dart';
import 'package:islami_c19_prod/utils/app_routes.dart';
import 'package:islami_c19_prod/utils/app_text_styles.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MostRecentProvider()),

        ChangeNotifierProvider(create: (context) => SebhaProvider()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'Islami C19',

        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.darkBrown,

          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.darkBrown,
            centerTitle: true,
            foregroundColor: AppColors.primary,
            titleTextStyle: AppTextStyles.bold20primary,
          ),

          textTheme: TextTheme(
            headlineMedium: TextStyle(
              fontFamily: "Janna LT",
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        routes: {
          AppRoutes.mainLayoutRoute: (_) => const MainLayout(),

          AppRoutes.suraDetailsRoute: (_) => const SuraDetailsScreen(),

          AppRoutes.onboardingRoute: (_) => const OnboardingScreen(),
        },

        initialRoute: AppRoutes.onboardingRoute,
      ),
    );
  }
}
