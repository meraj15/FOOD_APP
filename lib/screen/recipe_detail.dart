import 'package:flutter/material.dart';
import 'package:food_app/model/recipe.dart.dart';
import 'package:food_app/widgets/step_card.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Restaurant restaurant;

  const RecipeDetailScreen({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  restaurant.image,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Cooking Instructions",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: restaurant.steps.length,
                itemBuilder: (context, index) {
                  final step = restaurant.steps[index];
                  return StepCard(step: step, stepIndex: index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


