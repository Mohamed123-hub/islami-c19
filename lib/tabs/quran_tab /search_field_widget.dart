import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';

class SearchField extends StatelessWidget {
  final Function(String) onChanged;

  const SearchField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.bold20white,
      onChanged: (value) {
        print(value);
        onChanged(value);
      },
      decoration: InputDecoration(
        prefixIcon: Image.asset(
          Assets.images.searchIc.path,
          color: AppColors.primary,
        ),
        labelText: "Sura Name",
        labelStyle: AppTextStyles.bold16white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }
}