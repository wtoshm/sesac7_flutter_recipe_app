import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/use_case/get_recipe_summaries_use_case.dart';
import 'package:flutter_recipe_app/domain/use_case/get_saved_recipe_summaries_use_case.dart';
import 'package:flutter_recipe_app/presentation/screens/saved_recipe_summaries/saved_recipe_summaries_state.dart';

class SavedRecipeSummariesViewModel with ChangeNotifier {
  final GetSavedRecipeSummariesUseCase _getSavedRecipeSummariesUseCase;

  SavedRecipeSummariesViewModel({
    required GetSavedRecipeSummariesUseCase getSavedRecipeSummariesUseCase,
  }) : _getSavedRecipeSummariesUseCase = getSavedRecipeSummariesUseCase;

  SavedRecipeSummariesState _state = SavedRecipeSummariesState();

  SavedRecipeSummariesState get state => _state;

  void fetchSavedRecipeSummaries() async {
    final savedRecipeSummaries = await _getSavedRecipeSummariesUseCase.execute();

    _state = _state.copyWith(
      recipeSummaries: savedRecipeSummaries,
    );

    notifyListeners();
  }


  // void removeSavedRecipe(String id) {
  //   _bookmarkRepository.removeBookmarks(id);
  //   fetchSavedRecipes();
  // }


}