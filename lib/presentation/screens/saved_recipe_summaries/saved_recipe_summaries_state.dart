import 'package:flutter_recipe_app/data/models/recipe_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "saved_recipe_summaries_state.freezed.dart";

@freezed
class SavedRecipeSummariesState with _$SavedRecipeSummariesState {
  @override
  final List<RecipeSummary> recipeSummaries;

  SavedRecipeSummariesState({
    this.recipeSummaries = const [],
  });
}