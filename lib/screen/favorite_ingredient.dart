import 'package:flutter/material.dart';
import 'package:food_app/provider/provider.dart';
import 'package:provider/provider.dart';

class FavoriteIngredient extends StatelessWidget {
  const FavoriteIngredient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Favorite Ingredient"),
      ),
      body: ListView.builder(
        itemCount: context.watch<Data>().favoritesIngredient.length,
        itemBuilder: (context, index) {
          final ingredient = context.read<Data>();
          return Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  ingredient.favoritesIngredient[index].image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(ingredient.favoritesIngredient[index].name),
              trailing: IconButton(
                onPressed: () {
                  context.read<Data>().deleteFavoriteIngredient(index);
                },
                icon:const Icon(Icons.delete),
              ),
            ),
          );
        },
      ),
    );
  }
}
