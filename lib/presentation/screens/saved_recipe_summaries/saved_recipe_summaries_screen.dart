import 'package:flutter/material.dart';

import 'package:flutter_recipe_app/presentation/components/cards/recipe_summary_card.dart';
import 'package:flutter_recipe_app/presentation/screens/saved_recipe_summaries/saved_recipe_summaries_view_model.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SavedRecipeSummariesScreen extends StatelessWidget {
  // 받아서 뿌릴 데이터를 ViewModel로부터 생성자를 통해 viewModel 이름으로 주입받고
  final SavedRecipeSummariesViewModel viewModel;
  final void Function(int id) onTapRecipeCard;

  const SavedRecipeSummariesScreen({
    super.key,
    required this.viewModel,
    required this.onTapRecipeCard,
  });

  // ListenableBuilder() 를 Scaffold를 감싸거나
  // body의 ListView.builder를 감싸고 listenable 속성에 viewModel을 설정,
  // 데이터는 List 형태가 많으므로 viewModel.recipes 의 형태,
  // itemCount에 viewModel.recipes.length,
  // itemBuilder 에 리스트의 1개 데이터를
  // final Recipe recipe = viewModel.recipes[index]; 로 세팅
  @override
  Widget build(BuildContext context) {
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved recipes',
          style: TextStyles.mediumTextBold,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: state.recipeSummaries.length,
        itemBuilder: (context, index) {
          final recipeSummary = state.recipeSummaries[index];
          return GestureDetector(
            onTap: () => onTapRecipeCard(recipeSummary.id),
            child: RecipeSummaryCard(recipeSummary: recipeSummary),
          );
        },
      ),
    );
  }
  // // 헬퍼 함수
  // Widget _buildBody() {
  //   if (viewModel.isLoading) {
  //     return const Center(
  //       child: CircularProgressIndicator(),
  //     );
  //   }
  //   if (viewModel.errorMessage != null) {
  //     return Center(
  //       child: Text(viewModel.errorMessage!),
  //     );
  //   }
  //   return ListView.builder(
  //     itemCount: viewModel.savedRecipes.length,
  //     itemBuilder: (context, index) {
  //       final recipe = viewModel.savedRecipes[index];
  //       return GestureDetector(
  //         onTap: () => onTapRecipe(recipe),
  //         child: RecipeCard(recipe: recipe),
  //       );
  //     },
  //   );
  // }

}




// ListenableBuilder(
// listenable: viewModel,
// builder: (context, child) {
// return ListView.builder(
// itemCount: viewModel.savedRecipes.length,
// itemBuilder: (context, index) {
// final Recipe recipe = viewModel.savedRecipes[index];
//
// final String category = recipe.category;
// final int id = recipe.id;
// final String name = recipe.name;
// final String imageUrl = recipe.imageUrl;
// final String chef = recipe.chef;
// final String cookingTime = recipe.cookingTime;
// final double rating = recipe.rating;
//
// return Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 30,
// vertical: 10,
// ),
// child: GestureDetector(
// onTap: () {
// onTapRecipeCard(recipe);
// },
// child: RecipeCard(
// recipe: Recipe(
// category: category,
// id: id,
// name: name,
// imageUrl: imageUrl,
// chef: chef,
// cookingTime: cookingTime,
// rating: rating,
// ),
// ),
// ),
// );
// },
// );
// },
// ),

// void main() {
//   final recipesViewModel = SavedRecipesViewModel(
//     RecipeRepositoryImpl(MockRecipeDataSourceImpl()),
//   );
//
//   recipesViewModel.fetchRecipes();
//
//   runApp(
//     MaterialApp(
//       home: SavedRecipesScreen(viewModel: recipesViewModel,),
//     ),
//   );
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(
//         'Saved recipes',
//         style: TextStyles.mediumTextBold,
//       ),
//       centerTitle: true,
//     ),
//     body: ListView.builder(
//       itemCount: jsonRecipes['recipes']!.length,
//       itemBuilder: (context, index) {
//         final jsonRecipe = jsonRecipes['recipes']![index];
//
//         final String name = jsonRecipe['name'] as String;
//         final String imageUrl = jsonRecipe['image'] as String;
//         final String chef = jsonRecipe['chef'] as String;
//         final String cookingTime = jsonRecipe['time'] as String;
//         final double rating = jsonRecipe['rating'] as double;
//
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//           child: RecipeCard(
//             recipe: Recipe(
//               name: name,
//               imageUrl: imageUrl,
//               chef: chef,
//               cookingTime: cookingTime,
//               rating: rating,
//               onChangeFavorite: () {},
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }
