import 'package:flutter_recipe_app/data/mock_data/recipe_mock_data/mock_json_recipe_summary_list.dart';
import 'package:flutter_recipe_app/data/models/recipe_summary.dart';
import 'package:flutter_recipe_app/data/repositories/recipe_summary_repository.dart';

class RecipeSummaryRepositoryImpl implements RecipeSummaryRepository {
  @override
  Future<List<RecipeSummary>> getRecipeSummaries() async {
    await Future.delayed(const Duration(seconds: 1));

    return mockJsonRecipeSummaryList.map((e) => RecipeSummary.fromJson(e)).toList();
  }

}

// void main() async {
//   final list = await RecipeSummaryRepositoryImpl().getRecipeSummaries();
//   print(list[0]);
// }