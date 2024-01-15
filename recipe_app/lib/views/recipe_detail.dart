import 'package:flutter/material.dart';
import 'package:recipe_app/data/recipe.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({super.key, required this.recipes});

  final Recipes recipes;

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipes.label),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(widget.recipes.imageURL, width: double.infinity),
            const SizedBox(height: 20.0),
            Text(
              widget.recipes.label,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.all(20.0),
              itemCount: widget.recipes.ingredients.length,
              itemBuilder: (context, index) {
                final ingredient = widget.recipes.ingredients[index];
                return Text(
                  '${ingredient.quantity * _sliderValue} ${ingredient.storageType} ${ingredient.name}',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                );
              },
            )),
            Text(
              'Servings: ${_sliderValue.toInt()}',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            Slider(
                value: _sliderValue.toDouble(),
                min: 1,
                max: 10,
                divisions: 9,
                activeColor: Colors.green,
                inactiveColor: Colors.black,
                label: _sliderValue.toInt().toString(),
                onChanged: (newValue) {
                  setState(() {
                    _sliderValue = newValue.toInt();
                  });
                  debugPrint(newValue.toString());
                }),
            const SizedBox(height: 20.0)
          ],
        ),
      ),
    );
  }
}
