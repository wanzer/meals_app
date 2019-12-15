import 'package:flutter/material.dart';
import 'package:meals_app/widgets/mealItem.dart';
import '../dummyData.dart';

class CategoryMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routesArgs['id'];
    final categoryTitle = routesArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: categoryMeals[index].id,
                  title: categoryMeals[index].title,
                  imageUrl: categoryMeals[index].imageUrl,
                  duration: categoryMeals[index].duration,
                  affordability: categoryMeals[index].affordability,
                  complexity: categoryMeals[index].complexity);
            },
            itemCount: categoryMeals.length));
  }
}
