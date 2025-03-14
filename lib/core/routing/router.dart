import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../../data/repository/mock_bookmark_repository_impl.dart';
import '../../data/repository/mock_recipe_repository_impl.dart';
import '../../domain/model/recipe.dart';
import '../../domain/use_case/get_saved_recipes_use_case.dart';
import '../../presentation/saved_recipes/saved_recipes_screen.dart';
import '../../presentation/sign_in/sign_in_screen.dart';
import '../../presentation/sign_up/sign_up_screen.dart';

final router = GoRouter(
  initialLocation: '/Splash',
  routes: [
    GoRoute(
      path: '/SignUp',
      builder: (context, state) => SignUpScreen(
        onTapSignIn: () => context.go('/SignIn'),
      ),
    ),
    GoRoute(
      path: '/Splash',
      builder: (context, state) => SplashScreen(
        onTapStartCooking: () => context.go('/SignIn'),
      ),
    ),
    GoRoute(
      path: '/SignIn',
      builder: (context, state) => SignInScreen(
        onTapSignUp: () => context.go('/SignUp'),
        onTapSignIn: () => context.go('/SavedRecipes'),
      ),
    ),
    GoRoute(
      path: '/SavedRecipes',
      builder: (context, state) => FutureBuilder<List<Recipe>>(
          future: GetSavedRecipesUseCase(
            recipeRepository: MockRecipeRepositoryImpl(),
            bookMarkRepository: MockBookmarkRepositoryImpl(),
          ).excute(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final recipes = snapshot.data!;

            return SavedRecipesScreen(
              recipes: recipes,
            );
          }),
    ),
  ],
);
