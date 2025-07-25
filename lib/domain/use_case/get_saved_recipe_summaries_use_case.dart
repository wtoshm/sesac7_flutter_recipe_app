
import 'package:flutter_recipe_app/data/models/recipe_summary.dart';
import 'package:flutter_recipe_app/data/models/user.dart';
import 'package:flutter_recipe_app/domain/use_case/get_recipe_summaries_use_case.dart';
import 'package:flutter_recipe_app/domain/use_case/get_user_use_case.dart';

class GetSavedRecipeSummariesUseCase {
  final GetRecipeSummariesUseCase _getRecipeSummariesUseCase;
  final GetUserUseCase _getUserUseCase;

  const GetSavedRecipeSummariesUseCase({
    required GetRecipeSummariesUseCase getRecipeSummariesUseCase,
    required GetUserUseCase getUserUseCase,
  }) : _getRecipeSummariesUseCase = getRecipeSummariesUseCase,
        _getUserUseCase = getUserUseCase;

  Future<List<RecipeSummary>> execute() async {
    final allRecipeSummaries = await _getRecipeSummariesUseCase.execute();
    final user = await _getUserUseCase.execute();
    final Set<int> bookmarks = user.bookmarks;

    final List<RecipeSummary> filteredRecipeSummaries = allRecipeSummaries
        .where((recipeSummary) => bookmarks.contains(recipeSummary.id))
        .toList();
    final recipes = filteredRecipeSummaries;
    return recipes;
  }

}