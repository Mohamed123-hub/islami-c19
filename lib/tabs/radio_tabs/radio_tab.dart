import 'package:flutter/material.dart';
import '../../models/radio_card.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/radiobackground.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Image.asset(
              "assets/images/sebhalogo.png",
              width: 300,
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xff202020),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xffE2BE7F),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffE2BE7F),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text(
                            "Radio",
                            style: TextStyle(
                              color: Color(0xff202020),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Reciters",
                          style: TextStyle(
                            color: Color(0xffE2BE7F),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 20),
                children: const [
                  RadioCard(
                    title: "Radio Ibrahim Al-Akdar",
                    backgroundImage: "assets/images/radiocard.png",
                  ),

                  RadioCard(
                    title: "Radio Al-Qaria Yassen",
                    backgroundImage: "assets/images/radioCard2.png",
                    isPlaying: true,
                  ),

                  RadioCard(
                    title: "Radio Ahmed Al-trabulsi",
                    backgroundImage: "assets/images/radiocard.png",
                  ),

                  RadioCard(
                    title: "Radio Addokali Mohammad Alalim",
                    backgroundImage: "assets/images/radiocard.png",
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