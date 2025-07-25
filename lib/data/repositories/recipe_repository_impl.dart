import 'package:flutter_recipe_app/data/mock_data/recipe_mock_data/mock_json_all_recipes.dart';
import 'package:flutter_recipe_app/data/models/recipe.dart';
import 'package:flutter_recipe_app/data/repositories/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  @override
  Future<List<Recipe>> getRecipes() async {
    await Future.delayed(const Duration(seconds: 1));

    return mockJsonAllRecipes.map((e) => Recipe.fromJson(e)).toList();
  }
}
