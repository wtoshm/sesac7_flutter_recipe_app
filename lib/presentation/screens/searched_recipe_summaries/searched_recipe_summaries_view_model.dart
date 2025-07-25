import 'package:flutter/material.dart';

import 'package:flutter_recipe_app/data/repositories/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/data/repositories/recipe_summary_repository.dart';

import 'package:flutter_recipe_app/presentation/screens/searched_recipe_summaries/searched_recipe_summaries_state.dart';

class SearchedRecipeSummariesViewModel with ChangeNotifier {
  final RecipeSummaryRepository _recipeSummaryRepository;

  SearchedRecipeSummariesViewModel({
    required RecipeSummaryRepository recipeSummaryRepository,
  }) : _recipeSummaryRepository = recipeSummaryRepository;

  SearchedRecipeSummariesState _state = SearchedRecipeSummariesState();
  SearchedRecipeSummariesState get state => _state;

  // final List<Recipe> allRecipes;
  // @override
  // final List<Recipe> searchedRecipes;
  // @override
  // final List<Recipe> filteredRecipes;
  // @override
  // final bool isRecipesLoading;
  //
  // @override
  // final String keyword;

  Future<void> fetchRecipes() async {
    _state = state.copyWith(isRecipesLoading: true);

   // final List<Recipe> allRecipes = await _recipeRepository.getAllRecipes();
   // _state = state.copyWith(allRecipes: allRecipes, );

  }


  // List<Recipe> _allRecipes = [];
  // List<Recipe> get allRecipes => List.unmodifiable(_allRecipes);
  //
  // List<Recipe> _searchedRecipes = [];
  // List<Recipe> get searchedRecipes => _searchedRecipes;
  //
  // List<Recipe> _filteredRecipes = [];
  // List<Recipe> get filteredRecipes => _filteredRecipes;
  //
  // String _keyword = '';
  // String get keyword => _keyword;
  //
  // bool _isRecipesLoading = false;
  // bool get isRecipesLoading => _isRecipesLoading;

}