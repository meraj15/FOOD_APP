import 'package:flutter/material.dart';
import 'package:food_app/screen/favarite.screen.dart';
import 'package:food_app/screen/recipe_card.dart';
import 'package:food_app/widgets/favorite_recipe_card.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 228,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Color.fromARGB(255, 224, 79, 66)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/profile.png",
                  ),
                  radius: 50,
                ),
                SizedBox(height: 10),
                Text(
                  "Khan Meraj",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "khanmeraj1542005@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                createDrawerItem(
                  icon: Icons.home,
                  text: 'Home',
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const HomeScreen();
                    }));
                  },
                ),
                createDrawerItem(
                  icon: Icons.favorite,
                  text: 'Favorites',
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const FavoriteRecipeScreen();
                    }));
                  },
                ),
                createDrawerItem(
                  icon: Icons.history,
                  text: 'Order History',
                  onTap: () {
                    // Navigator.of(context).pushNamed('/order-history');
                  },
                ),
                createDrawerItem(
                  icon: Icons.settings,
                  text: 'Settings',
                  onTap: () {
                    // Navigator.of(context).pushNamed(AppRoutes.profileScreen);
                  },
                ),
                const Divider(),
                createDrawerItem(
                  icon: Icons.help,
                  text: 'Help & Support',
                  onTap: () {
                    Navigator.of(context).pushNamed('/help-support');
                  },
                ),
                createDrawerItem(
                  icon: Icons.logout,
                  text: 'Logout',
                  onTap: () {
                    Navigator.of(context).pushNamed('/lougout');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget createDrawerItem({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.red,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    );
  }
}
