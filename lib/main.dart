import 'package:flutter/material.dart';
import 'package:food_app/screen/recipe_card.dart';
import 'package:food_app/provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Data(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter recipe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
