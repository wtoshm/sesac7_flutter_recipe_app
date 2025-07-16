import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class RatingButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const RatingButton({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 28,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary100 : AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: isSelected ? Border.all(color: AppColors.primary100, width: 1) : Border.all(color: AppColors.primary80, width: 1),
      ),
      child: isSelected ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('5', style: TextStyles.smallerTextRegular.copyWith(color: AppColors.white),),
          // SizedBox(width: 0.5),
          Icon(
            Icons.star_rate_rounded,
            color: AppColors.white,
            size: 18,
          ),
        ],
      ) : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('5', style: TextStyles.smallerTextRegular.copyWith(color: AppColors.primary80),),
          // SizedBox(width: 0.5),
          Icon(
            Icons.star_rate_rounded,
            color: AppColors.primary80,
            size: 18,
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: RatingButton(text: '5', isSelected: false),
          ),
        ),
      ),
    ),
  );
}