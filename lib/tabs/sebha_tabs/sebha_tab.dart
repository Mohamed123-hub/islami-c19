import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/sebha_provider.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SebhaProvider>();

    return Container(
      width: double.infinity,
      height: double.infinity,

      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/sebha_background.png"),
          fit: BoxFit.cover,
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Image.asset("assets/images/sebhalogo.png", width: 300),

          const SizedBox(height: 20),

          const Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            textAlign: TextAlign.center,

            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: .w700,
            ),
          ),

          const SizedBox(height: 30),

          GestureDetector(
            onTap: () {
              provider.increment();
            },

            child: Stack(
              alignment: Alignment.center,

              children: [
                Image.asset("assets/images/sebhaBody.png", width: 400),

                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      const Text(
                        "سبحان الله",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: .w700,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "${provider.count}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: .w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
