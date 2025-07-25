import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_summary.freezed.dart';
part 'recipe_summary.g.dart';

@freezed
@JsonSerializable()
class RecipeSummary with _$RecipeSummary {
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

  const RecipeSummary({
    required this.category,
    required this.id,
    required this.name,
    required this.image,
    required this.chef,
    required this.time,
    required this.rating,
  });

  factory RecipeSummary.fromJson(Map<String, Object?> json) =>
      _$RecipeSummaryFromJson(json);
  Map<String, Object?> toJson() => _$RecipeSummaryToJson(this);
}