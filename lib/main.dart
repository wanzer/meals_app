import 'package:flutter/material.dart';
import 'package:meals_app/dummyData.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/favoritesScreen.dart';
import 'package:meals_app/screens/filtersScreen.dart';
import 'package:meals_app/screens/mealDetailScreen.dart';
import 'package:meals_app/screens/tabsScreen.dart';
import './screens/categoriesScreen.dart';
import './screens/categoryMealScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  MyAppState createState() => MyAppState();

}

class MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> _favoriteMeal = [];

  void _setFilters(Map<String, bool> filterData){
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal){

        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        return true;

      }).toList();
    });
  }

  void _toogleFavorite(String mealId){
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);

    if(existingIndex >=0){
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    }else {
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1)
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          )
        )
      ),
      home: TabsScreen(_favoriteMeal),

      routes: {
        //'/': (ctx) => TabsScreen(),
        TabsScreen.tabsRout: (ctx) => TabsScreen(_favoriteMeal),
        '/categories_screen': (ctx) => CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName : (ctx) => MealDetailScreen(_toogleFavorite, _isMealFavorite),
        FiltersScreen.filterRout : (ctx) => FiltersScreen(_filters, _setFilters)
      },
      onGenerateRoute: (settings){
        print(settings.arguments);
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute (builder: (ctx) => CategoriesScreen());
      },
    );
  }
}


