// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:recipe/model/recipe.api.dart';
import 'package:recipe/model/recipe_model.dart';
import 'package:recipe/screens/widget/recipe_card.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<Recipe>? _recipes;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipe();
  }

  Future<void> getRecipe() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      isLoading = false;
    });
    print('>>>>>>>>>$_recipes');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.restaurant_menu,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Recipe Api",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return RecipeCardWodget(
                  cookingTime: '5 Min',
                  foodTitle: _recipes![index].name!,
                  imageUrl: _recipes![index].images!,
                  rating: '5',
                );
              },
              itemCount: _recipes?.length,
            ),
    );
  }
}
