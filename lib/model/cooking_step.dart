import 'package:food_app/model/ingredient.dart';

class CookingStep {
  final String description;
  final List<Ingredient> ingredients;

  CookingStep({
    required this.description,
    required this.ingredients,
  });

  factory CookingStep.fromMap(Map<String, dynamic> map) {
    String description = map['step'];

    List<Ingredient> ingredients = (map['ingredients'] as List)
        .map((ingredientMap) => Ingredient.fromMap(ingredientMap))
        .toList();

    return CookingStep(
      description: description,
      ingredients: ingredients,
    );
  }
}
