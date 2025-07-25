import 'package:flutter_recipe_app/data/models/recipe.dart';
import 'package:flutter_recipe_app/data/models/recipe_summary.dart';
import 'package:flutter_recipe_app/data/repositories/recipe_summary_repository.dart';

class GetRecipeSummariesUseCase {
  final RecipeSummaryRepository _recipeSummaryRepository;

  const GetRecipeSummariesUseCase({
    required RecipeSummaryRepository recipeSummaryRepository,
  }) : _recipeSummaryRepository = recipeSummaryRepository;

  Future<List<RecipeSummary>> execute() async {
    return await _recipeSummaryRepository.getRecipeSummaries();
  }


}