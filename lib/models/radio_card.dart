import 'package:flutter/material.dart';

class RadioCard extends StatelessWidget {
  final String title;
  final String backgroundImage;
  final bool isPlaying;

  const RadioCard({
    super.key,
    required this.title,
    required this.backgroundImage,
    this.isPlaying = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xffE2BE7F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                backgroundImage,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xff202020),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          isPlaying
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          size: 48,
                          color: const Color(0xff202020),
                        ),
                      ),

                      const SizedBox(width: 16),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          isPlaying
                              ? Icons.volume_off_rounded
                              : Icons.volume_up_rounded,
                          size: 34,
                          color: const Color(0xff202020),
                        ),
                      ),
                    ],
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