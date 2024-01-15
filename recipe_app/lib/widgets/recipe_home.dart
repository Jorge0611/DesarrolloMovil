import 'package:flutter/material.dart';
import 'package:recipe_app/data/recipe.dart';
import 'package:recipe_app/views/recipe_detail.dart';

class RecipeHome extends StatefulWidget {
  const RecipeHome({super.key, required this.title});

  final String title;

  @override
  State<RecipeHome> createState() => _RecipeHomeState();
}

class _RecipeHomeState extends State<RecipeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.builder(
          itemCount: Recipes.samples.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: buildRecipeCard(Recipes.samples[index]),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RecipeDetail(recipes: Recipes.samples[index]);
                }));
              },
            );
          }),
    );
  }
}

Card buildRecipeCard(Recipes recipes) {
  return Card(
    elevation: 2.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Image.asset(recipes.imageURL),
          const SizedBox(height: 14.0),
          Text(recipes.label),
        ])),
  );
}
