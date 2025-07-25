import 'package:flutter_recipe_app/data/models/recipe.dart';
import 'package:flutter_recipe_app/data/repositories/recipe_repository.dart';

class GetRecipesUseCase {
  final RecipeRepository _recipeRepository;

  const GetRecipesUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<List<Recipe>> execute() async {
    return await _recipeRepository.getRecipes();
  }
}