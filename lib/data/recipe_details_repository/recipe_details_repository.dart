import 'package:flutter_recipe_app/data/recipe_dto/recipe_dto.dart';

abstract interface class RecipeDetailsRepository {
  Future<List<Ingredient>> getIngredients(int recipeId);
}