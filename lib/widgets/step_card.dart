import 'package:flutter/material.dart';
import 'package:food_app/model/cooking_step.dart';
import 'package:food_app/widgets/ingredient_tile.dart';

class StepCard extends StatelessWidget {
  final CookingStep step;
  final int stepIndex;

  const StepCard({
    super.key,
    required this.step,
    required this.stepIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Step ${stepIndex + 1}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              step.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: step.ingredients.length,
              itemBuilder: (context, ingredientIndex) {
                final ingredient = step.ingredients[ingredientIndex];
                return IngredientTile(ingredient: ingredient);
              },
            ),
          ],
        ),
      ),
    );
  }
}
