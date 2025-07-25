import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
@JsonSerializable()
class Ingredient with _$Ingredient {
  @override
  final int id;
  @override
  final String title;
  @override
  final String imageUrl;
  @override
  final int quantity;

  Ingredient({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.quantity,
  });

  factory Ingredient.fromJson(Map<String, Object?> json) =>
      _$IngredientFromJson(json);
  Map<String, Object?> toJson() => _$IngredientToJson(this);
}