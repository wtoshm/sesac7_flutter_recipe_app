import 'package:flutter_recipe_app/data/models/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_details_state.freezed.dart';

@freezed
class RecipeDetailsState with _$RecipeDetailsState {
  @override
  final Recipe? recipe;

  const RecipeDetailsState({
    this.recipe,
  });
}