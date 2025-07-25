import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/use_case/get_recipe_use_case.dart';
import 'package:flutter_recipe_app/presentation/screens/recipe_details/recipe_details_state.dart';

class RecipeDetailsViewModel extends ChangeNotifier {
  final GetRecipeUseCase _getRecipeUseCase;

  RecipeDetailsState _state = RecipeDetailsState();

  RecipeDetailsState get state => _state;

  RecipeDetailsViewModel({
    required GetRecipeUseCase getRecipeUseCase,
  }) : _getRecipeUseCase = getRecipeUseCase;

  // void fetchRecipe() async {
  //   _state = state.copyWith(
  //     recipe: await _getRecipeUseCase.execute()
  //   );
  //   notifyListeners();
  // }


}