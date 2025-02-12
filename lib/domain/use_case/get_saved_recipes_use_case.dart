import 'package:flutter_recipe_app/domain/repository/bookmark_repository.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';

import '../model/recipe.dart';

class GetSavedRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final BookMarkRepository _bookMarkRepository;

  GetSavedRecipesUseCase(
      {
        required RecipeRepository recipeRepository,
        required BookMarkRepository bookMarkRepository
      }) : _recipeRepository = recipeRepository,
        _bookMarkRepository = bookMarkRepository;

  Future<List<Recipe>> excute() async {
    final ids = await _bookMarkRepository.getBookmarkIds();
    final recipes = await _recipeRepository.getRecipes();
    return recipes.where((e) => ids.contains(e.id)).toList();
  }
}
