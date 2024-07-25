import 'package:flutter/material.dart';
import 'package:food_app/model/recipe.dart.dart';
import 'package:food_app/provider/provider.dart';
import 'package:food_app/screen/favarite.screen.dart';
import 'package:food_app/screen/favorite_ingredient.dart';
import 'package:food_app/widgets/drawer.dart';
import 'package:food_app/widgets/restaurant_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final provider = context.read<Data>();
    provider.getFoods();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Data>();
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text("Food App"),
          ],
        ),
        actions: [
          const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const FavoriteRecipeScreen();
                  },
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text(
                "Recipes",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      body: provider.isLoaded
          ? const Center(child: CircularProgressIndicator())
          : provider.error.isNotEmpty
              ? getErrorUI(provider.error)
              : getBodyUI(provider.resturant),
    );
  }

  Widget getErrorUI(String error) {
    return Center(
      child: Text(error),
    );
  }

  Widget getBodyUI(List<Restaurant> restaurants) {
    return ListView.builder(
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
        return RestaurantCard(restaurant: restaurant);
      },
    );
  }
}
