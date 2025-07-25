import 'package:flutter/material.dart';

import 'package:flutter_recipe_app/data/models/recipe_summary.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SearchedRecipeCard extends StatelessWidget {
  final RecipeSummary recipeSummary;
  
  const SearchedRecipeCard({required this.recipeSummary});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      width: double.infinity,
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                recipeSummary.image,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withAlpha(0),
                      Colors.black.withAlpha(100),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 100, // Ensures text can wrap if the text is long
              child: Text(
                recipeSummary.chef,
                style: TextStyles.smallerTextRegular.copyWith(
                  color: AppColors.gray4,
                ),
              ),
            ),
            Positioned(
              bottom: 22,
              left: 10,
              right: 50, // Ensures text can wrap if the text is long
              child: Text(
                recipeSummary.name,
                style: TextStyles.smallTextBold.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: RatingWidget(rating: recipeSummary.rating),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingWidget extends StatelessWidget {
  final double rating;

  const RatingWidget({
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 37,
      height: 16,
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.secondary20,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            Icons.star_rate,
            color: AppColors.rating,
            size: 8,
          ),
          SizedBox(width: 3,),
          SizedBox(width: 12, height: 12, child: Text('4.0', style: TextStyles.smallerTextRegular.copyWith(fontSize: 8),)),
        ],
      ),
    );
  }
}

// Widget buildCookingTime() {
//   return Container(
//     width: 60,
//     height: 24,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Icon(Icons.timelapse_rounded, size: 17, color: AppColors.white,),
//         Text(
//           '20 min',
//           style: TextStyles.smallerTextRegular.copyWith(
//             color: AppColors.gray4,
//           ),
//         ),
//       ],
//     ),
//   );
// }

// void main() {
//   final Recipe recipe = Recipe(name: "Traditional spare ribs baked", imageUrl: "https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg", chef: "Chef John", cookingTime: "20 min", rating: 4.0, onChangeFavorite: () {},);
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Center(
//             child: SearchedRecipeCard(recipe: recipe),
//           ),
//         ),
//       ),
//     ),
//   );
// }
