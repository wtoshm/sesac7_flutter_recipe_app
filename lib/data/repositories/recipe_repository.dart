import 'package:flutter_recipe_app/data/models/recipe.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipes();
}