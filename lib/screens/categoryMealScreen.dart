import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/mealItem.dart';
import '../dummyData.dart';

class CategoryMealScreen extends StatefulWidget {
  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;
  var isListChanged = false;

  @override
  void initState() {
    //no context here available
    super.initState();
  }

  @override
  void didChangeDependencies() {
    //context is available here
    if (!isListChanged) {
      final routesArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routesArgs['id'];
      categoryTitle = routesArgs['title'];
      categoryMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();

      isListChanged = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  complexity: categoryMeals[index].complexity,
                  removeMeal: _removeMeal);
            },
            itemCount: categoryMeals.length));
  }
}
