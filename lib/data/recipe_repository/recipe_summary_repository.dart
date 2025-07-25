import 'package:flutter_recipe_app/data/models/recipe_summary.dart';

abstract interface class RecipeSummaryRepository {
  Future<List<RecipeSummary>> getRecipeSummaries();
}