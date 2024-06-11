import 'package:flutter/material.dart';
import 'package:food_app/provider/provider.dart';
import 'package:provider/provider.dart';

class FavoriteRecipeScreen extends StatelessWidget {
  const FavoriteRecipeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Recipes'),
      ),
      body: ListView.builder(
        itemCount: context.watch<Data>().favorites.length,
        itemBuilder: (context, index) {
          final restaurant = context.read<Data>();
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(restaurant.favorites[index].title),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    restaurant.favorites[index].image,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    context.read<Data>().deleteItem(index);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
