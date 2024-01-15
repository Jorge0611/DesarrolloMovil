import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/recipe_home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.grey,
              secondary: Colors.black,
            ),
      ),
      home: const RecipeHome(title: 'Recipe Calculator'),
    );
  }
}
