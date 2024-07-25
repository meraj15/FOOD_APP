import 'package:flutter/material.dart';
import 'package:food_app/provider/provider.dart';
import 'package:food_app/widgets/favorite_recipe_card.dart';
import 'package:provider/provider.dart';

class FavoriteRecipeScreen extends StatelessWidget {
  const FavoriteRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Recipes'),
      ),
      body: Consumer<Data>(
        builder: (context, data, child) {
          return ListView.builder(
            itemCount: data.favorites.length,
            itemBuilder: (context, index) {
              return FavoriteRecipeCard(
                favorite: data.favorites[index],
                onDelete: () => data.deleteItem(index),
              );
            },
          );
        },
      ),
    );
  }
}
