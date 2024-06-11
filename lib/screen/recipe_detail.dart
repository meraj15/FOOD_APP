import 'package:flutter/material.dart';
import 'package:food_app/model/recipe.dart.dart';

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
        title: Text("${restaurant.title}"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Image.network(restaurant.image),
              SizedBox(
                height: 7,
              ),
              Text(
                "Cooking Instructions",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              Container(child: Column(
                children: [Text("Step 1")],
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
