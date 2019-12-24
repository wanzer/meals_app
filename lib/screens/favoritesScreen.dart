import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/mealItem.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;

  FavoritesScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {

    if(favoriteMeal.isEmpty){
      return Center(
        child: Text("You have no favorites yet - start adding some"),
      );
    }else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: favoriteMeal[index].id,
                title: favoriteMeal[index].title,
                imageUrl: favoriteMeal[index].imageUrl,
                duration: favoriteMeal[index].duration,
                affordability: favoriteMeal[index].affordability,
                complexity: favoriteMeal[index].complexity);

                //removeMeal: _removeMeal);
          },
          itemCount: favoriteMeal.length);

    }
  }
}
