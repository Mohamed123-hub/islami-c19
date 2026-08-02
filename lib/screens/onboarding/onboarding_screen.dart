import 'package:flutter/material.dart';
import 'package:islami_c19_prod/utils/app_routes.dart';
import 'onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202020),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onboardingList.length,

                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },

                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Image.asset(
                        "assets/images/onboardinglogo.png",
                        width: 300,
                      ),

                      const SizedBox(height: 20),

                      Image.asset(onboardingList[index].image),

                      const SizedBox(height: 20),

                      Text(
                        onboardingList[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffE2BE7F),
                          fontSize: 24,
                          fontWeight: .w700,
                        ),
                      ),

                      const SizedBox(height: 50),

                      if (onboardingList[index].description.trim().isNotEmpty)
                        Text(
                          onboardingList[index].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xffE2BE7F),
                            fontSize: 20,
                            fontWeight: .w700,
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  // Back
                  if (currentIndex != 0)
                    TextButton(
                      onPressed: () {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },

                      child: const Text(
                        "Back",
                        style: TextStyle(
                          color: Color(0xffE2BE7F),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 50),

                  // Indicator
                  Row(
                    children: List.generate(onboardingList.length, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),

                        width: currentIndex == index ? 30 : 10,

                        height: 8,

                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? const Color(0xffE2BE7F)
                              : Colors.grey,

                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    }),
                  ),


                  TextButton(
                    onPressed: () {
                      if (currentIndex == onboardingList.length - 1) {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.mainLayoutRoute,
                        );
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },

                    child: Text(
                      currentIndex == onboardingList.length - 1
                          ? "Finish"
                          : "Next",

                      style: const TextStyle(
                        color: Color(0xffE2BE7F),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
