
import 'package:flutter_recipe_app/data/models/recipe_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'searched_recipe_summaries_state.freezed.dart';

@freezed
class SearchedRecipeSummariesState with _$SearchedRecipeSummariesState {
  @override
  final List<RecipeSummary> allRecipeSummaries;
  @override
  final List<RecipeSummary> searchedRecipeSummaries;
  @override
  final List<RecipeSummary> filteredRecipeSummaries;
  @override
  final bool isRecipesLoading;

  @override
  final String keyword;

  const SearchedRecipeSummariesState({
    this.allRecipeSummaries = const [],
    this.searchedRecipeSummaries = const [],
    this.filteredRecipeSummaries = const [],
    this.isRecipesLoading = false,
    this.keyword = '',
  });
}