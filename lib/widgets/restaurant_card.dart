import 'package:flutter/material.dart';
import 'package:food_app/model/recipe.dart.dart';
import 'package:food_app/provider/provider.dart';
import 'package:food_app/screen/recipe_detail.dart';
import 'package:provider/provider.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final isFavorite = context.watch<Data>().favorites.contains(restaurant);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return RecipeDetailScreen(restaurant: restaurant);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.35),
                    BlendMode.multiply,
                  ),
                  image: NetworkImage(restaurant.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 20,
              child: IconButton(
                onPressed: () {
                  context.read<Data>().toggleFavorite(restaurant);
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    restaurant.title,
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.grey.shade300,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 125,
              left: 210,
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.schedule,
                      color: Colors.yellow,
                      size: 18,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      "${restaurant.readyInMinutes} minutes",
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
