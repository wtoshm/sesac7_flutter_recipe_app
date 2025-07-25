import 'package:flutter/material.dart';

import 'package:flutter_recipe_app/data/mock_data/mock_procedures.dart';

import 'package:flutter_recipe_app/presentation/components/cards/chef_card_with_follow.dart';
import 'package:flutter_recipe_app/presentation/components/cards/recipe_details_recipe_card.dart';
import 'package:flutter_recipe_app/presentation/screens/recipe_details/recipe_details_view_model.dart';
import 'package:flutter_recipe_app/presentation/screens/recipe_details_tabs/procedures_tab_screen.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

import '../recipe_details_tabs/ingredients_tab_screen.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final RecipeDetailsViewModel viewModel;

  const RecipeDetailsScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final state = viewModel.state;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Recipe Details ${viewModel.state.recipe?.chef}'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.share_rounded, size: 20),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              // recipe_details_card
              RecipeDetailsRecipeCard(
                recipe: state.recipe!,
              ),
              SizedBox(height: 10),
              // chef
              ChefCardWithFollow(),
              SizedBox(height: 20),
              // tab bar and tab bar view
              TabBar(
                labelColor: AppColors.white,
                unselectedLabelColor: AppColors.primary100,
                indicatorSize: TabBarIndicatorSize.tab,
                // Makes the indicator fill the tab width
                indicator: BoxDecoration(
                  // This is the key part for the rectangular box
                  borderRadius: BorderRadius.circular(10.0),
                  // Optional: if you want rounded corners for the box
                  // Color of the rectangular box indicator
                  color: AppColors.primary100,
                ),
                indicatorPadding: EdgeInsetsGeometry.symmetric(horizontal: 7.5),
                tabs: [
                  Tab(text: 'Ingredients'),
                  Tab(text: 'Procedures'),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  children: [
                    IngredientsTabScreen(ingredients: state.recipe!.ingredients),
                    ProceduresTabScreen(procedures: state.recipe!.procedures),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}

// Recipe(
// name: "Traditional spare ribs baked",
// imageUrl:
// "https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg",
// chef: "Chef John",
// cookingTime: "20 min",
// rating: 4.0,
// onChangeFavorite: () {},
// )

// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: RecipeDetailsScreen(viewModel: ),
//     ),
//   );
// }
