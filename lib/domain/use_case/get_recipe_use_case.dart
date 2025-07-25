import 'package:flutter_recipe_app/data/models/recipe.dart';
import 'package:flutter_recipe_app/data/repositories/recipe_repository.dart';

class GetRecipeUseCase {
  final RecipeRepository _recipeRepository;
  final int recipeId;

  const GetRecipeUseCase({
    required this.recipeId,
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<Recipe> execute() async {
    final allRecipes = await _recipeRepository.getRecipes();
    final Recipe filteredRecipe = allRecipes
        .where((recipe) => recipe.id == recipeId)
        .toList()[0];
    final recipe = filteredRecipe;
    return recipe;
  }
}