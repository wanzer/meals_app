import 'package:flutter/material.dart';
import 'package:meals_app/screens/categoriesScreen.dart';
import 'package:meals_app/screens/favoritesScreen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.category), text: "Categories"),
              Tab(icon: Icon(Icons.favorite), text: "Favorite")
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          CategoriesScreen(),
          FavoritesScreen()
        ],),
      ),
    );
  }
}
