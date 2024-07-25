import 'package:flutter/material.dart';
import 'package:food_app/model/recipe.dart.dart';

class FavoriteRecipeCard extends StatelessWidget {
  final Restaurant favorite;
  final VoidCallback onDelete;

  const FavoriteRecipeCard({
    super.key,
    required this.favorite,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text(favorite.title),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              favorite.image,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          trailing: IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
