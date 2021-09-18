import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ptsganjil202112rpl2steve23/models/recipe.dart';
import 'package:ptsganjil202112rpl2steve23/models/recipe_api.dart';
import 'package:ptsganjil202112rpl2steve23/views/widget/recipe_card.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;


  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant,
                color: Colors.blueGrey,),
              SizedBox(width: 8),
              Text('Menu')
            ],
          ),
        ),
        body: Container(
          color: Colors.yellow[900],
          child: _isLoading ?
          Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: _recipes.length,
            itemBuilder: (context, index) {
              return RecipeCard(
                  title: _recipes[index].name,
                  cookTime: _recipes[index].totalTime,
                  rating: _recipes[index].rating.toString(),
                  thumbnailUrl: _recipes[index].images,

              );
            },
          ),
        ));
  }
}