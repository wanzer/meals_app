import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final routesArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routesArgs['id'];
    final categoryTitle = routesArgs['title'];

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(itemBuilder: (ctx, index){

        }, itemCount: 10)
    );
  }
}
