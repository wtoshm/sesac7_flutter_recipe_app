abstract class Routes {
  // Splash screen route
  static const String splash = '/splash';

  // Authentication routes
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';

  // Main tap routes
  static const String home = '/home';
  static const String savedRecipes = '/saved-recipes';
  static const String notifications = '/notifications';
  static const String profile = '/profile';
  static const String recipeDetails = '/recipe-details';
  static const String recipeDetailsWithId = '/recipe-details/:id';
  static const String ingredient = '/saved-recipes/ingredient';

  static String getRecipeDetailsWithId(int id) => '$recipeDetails/$id';


}