import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe/model/recipe_model.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', '/feeds/list', {'limit': '24', 'start': '0'});

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'c18a2bff6fmshc5ea851e9aadb5cp11895djsn014a40cc996c',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromsnapshot(_temp);
  }
}
