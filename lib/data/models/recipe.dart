import 'package:flutter_recipe_app/data/models/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
@JsonSerializable()
class Recipe with _$Recipe {
  @override
  final String category;
  @override
  final int id;
  @override
  final String name;
  @override
  final String image;
  @override
  final String chef;
  @override
  final String time;
  @override
  final double rating;
  @override
  final List<Ingredient> ingredients;
  @override
  final List<String> procedures;

  const Recipe({
    required this.category,
    required this.id,
    required this.name,
    required this.image,
    required this.chef,
    required this.time,
    required this.rating,
    required this.ingredients,
    required this.procedures,
  });

  factory Recipe.fromJson(Map<String, Object?> json) =>
      _$RecipeFromJson(json);
  Map<String, Object?> toJson() => _$RecipeToJson(this);
}