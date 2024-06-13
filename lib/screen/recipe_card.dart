import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/model/recipe.dart.dart';
import 'package:food_app/provider/provider.dart';
import 'package:food_app/screen/favarite.screen.dart';
import 'package:food_app/screen/favorite_ingredient.dart';
import 'package:food_app/screen/recipe_detail.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

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
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: ListTile(
                leading: Icon(Icons.favorite, color: Colors.orange),
                title: Text(
                  "Favorite Ingredient",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return FavoriteIngredient();
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text("Food App"),
          ],
        ),
        actions: [
          Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              debugPrint("clicked");
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return FavoriteRecipeScreen();
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
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
          ? Center(child: CircularProgressIndicator())
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

  Widget getBodyUI(List<Restaurant> restaurant) {
    return ListView.builder(
      itemCount: restaurant.length,
      itemBuilder: (context, index) {
        final resturant = restaurant[index];
        final isFavorite = context.watch<Data>().favorites.contains(resturant);
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return RecipeDetailScreen(restaurant: resturant);
                },
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
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
                      image: NetworkImage(resturant.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (isFavorite) {
                          context.read<Data>().favorites.remove(resturant);
                        } else {
                          context.read<Data>().favorites.add(resturant);
                        }
                      });
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
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        restaurant[index].title,
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
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Colors.yellow,
                          size: 18,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "${resturant.readyInMinutes} minutes",
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
