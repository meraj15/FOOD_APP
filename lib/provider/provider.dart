import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/model/recipe.dart.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Data extends ChangeNotifier {
  final endPoint =
      "https://api.spoonacular.com/recipes/random?limitLicense=true&number=20&apiKey=7a85ed4814064a2a90fb0429a049930d";
  bool isLoaded = true;
  String error = "";
 bool isfavoriteClicked = false;
  List<Restaurant> resturant = [];
  List<Restaurant> favorites = [];
  getFoods() async {
    Response response = await http.get(Uri.parse(endPoint));
    final mapResponse = jsonDecode(response.body);
    final getMap = mapResponse["recipes"];
    for (int i = 0; i < getMap.length; i++) {
      resturant.add(Restaurant.fromMap(getMap[i]));
    }
    isLoaded = false;
    notifyListeners();
  }

  void deleteItem(int index) {
    favorites.removeAt(index);
    notifyListeners();
  }
}
