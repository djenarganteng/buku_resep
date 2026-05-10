import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'recipe_data.dart';

const String _savedRecipesKey = 'saved_recipe_keys';

final ValueNotifier<Set<String>> savedRecipeKeys = ValueNotifier<Set<String>>(
  <String>{},
);

String recipeKey(Recipe recipe) => '${recipe.region}::${recipe.title}';

Set<String> get _defaultSavedRecipeKeys => recipes
    .where((Recipe recipe) => recipe.saved)
    .map(recipeKey)
    .toSet();

Future<void> loadStoredBookmarks() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final List<String>? storedKeys = prefs.getStringList(_savedRecipesKey);

  if (storedKeys == null) {
    savedRecipeKeys.value = _defaultSavedRecipeKeys;
    await prefs.setStringList(
      _savedRecipesKey,
      savedRecipeKeys.value.toList(),
    );
    return;
  }

  savedRecipeKeys.value = storedKeys.toSet();
}

Future<void> toggleRecipeBookmark(Recipe recipe) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final Set<String> nextKeys = Set<String>.from(savedRecipeKeys.value);
  final String key = recipeKey(recipe);

  if (nextKeys.contains(key)) {
    nextKeys.remove(key);
  } else {
    nextKeys.add(key);
  }

  savedRecipeKeys.value = nextKeys;
  await prefs.setStringList(_savedRecipesKey, nextKeys.toList());
}

bool isRecipeSaved(Recipe recipe) => savedRecipeKeys.value.contains(recipeKey(recipe));

List<Recipe> get bookmarkedRecipes => recipes
    .where((Recipe recipe) => savedRecipeKeys.value.contains(recipeKey(recipe)))
    .toList();
