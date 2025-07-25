// GoRouter configuration
import 'package:flutter/material.dart';

import 'package:flutter_recipe_app/core/routing/routes.dart';

import 'package:flutter_recipe_app/domain/use_case/get_saved_recipe_summaries_use_case.dart';
import 'package:flutter_recipe_app/presentation/screens/auth/sign_up_screen.dart';
import 'package:flutter_recipe_app/presentation/screens/home/home_screen.dart';
import 'package:flutter_recipe_app/presentation/screens/main_screen/tabs_screen.dart';
import 'package:flutter_recipe_app/presentation/screens/notifications/notifications_screen.dart';
import 'package:flutter_recipe_app/presentation/screens/profile/profile_screeen.dart';

import 'package:flutter_recipe_app/presentation/screens/saved_recipe_summaries/saved_recipe_summaries_screen.dart';
import 'package:flutter_recipe_app/presentation/screens/saved_recipe_summaries/saved_recipe_summaries_view_model.dart';

import 'package:flutter_recipe_app/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/auth/sign_in_screen.dart';


final GoRouter router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    // GoRoute(
    //   path: Routes.recipeDetailsWithId,
    //   builder: (context, state) {
    //     final id = state.pathParameters['id'];
    //     if (id == null) {
    //       return Scaffold(
    //         body: Center(
    //           child: Text('잘못된 페이지 요청'),
    //         ),
    //       );
    //     }
    //     final viewModel = RecipeDetailsViewModel(
    //       getRecipeUseCase: _getRecipeUseCase,
    //     );
    //     viewModel.fetchRecipe(int.parse(id));
    //
    //     return ListenableBuilder(
    //       listenable: viewModel,
    //       builder: (context, child) {
    //         return RecipeDetailsScreen(viewModel: viewModel);
    //       },
    //     );
    //   },
    // ),
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => SplashScreen(
        onTapStartCooking: () => context.go(Routes.signIn),
      ),
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (BuildContext context, GoRouterState state) => SignInScreen(
        onTapSignIn: () {
          context.go(Routes.home);
        },
        onTapSignUp: () => context.go(Routes.signUp),
      ),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (BuildContext context, GoRouterState state) => SignUpScreen(
        onTapSignIn: () => context.go(Routes.signIn),
      ),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return TabsScreen(
          body: navigationShell,
          currentIndex: navigationShell.currentIndex,
          onTap: (int index) {
            navigationShell.goBranch(index);
          },
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipes,
              builder: (context, state) {
                final viewModel = SavedRecipeSummariesViewModel(
                GetSavedRecipeSummariesUseCase
                );

                viewModel.fetchSavedRecipes();
                return ListenableBuilder(
                  listenable: viewModel,
                  builder: (context, child) {
                    return SavedRecipeSummariesScreen(
                      viewModel: viewModel,
                      onTapRecipeCard:
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.notifications,
              builder: (context, state) {
                return const NotificationsScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profile,
              builder: (context, state) {
                return const ProfileScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
