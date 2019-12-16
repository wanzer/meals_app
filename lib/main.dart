import 'package:flutter/material.dart';
import 'package:meals_app/screens/favoritesScreen.dart';
import 'package:meals_app/screens/mealDetailScreen.dart';
import 'package:meals_app/screens/tabsScreen.dart';
import './screens/categoriesScreen.dart';
import './screens/categoryMealScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      home: MyHomePage(title: 'Meals'),

      routes: {
        '/categories_screen': (ctx) => CategoryMealScreen(),
        MealDetailScreen.routeName : (ctx) => MealDetailScreen()
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

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return
//      Scaffold(
//      appBar: AppBar(
        
       // title: Text(widget.title),
      //),
      //body: CategoriesScreen(),
      TabsScreen();
      //);
  }
}
