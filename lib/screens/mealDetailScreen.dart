import 'package:flutter/material.dart';
import 'package:meals_app/dummyData.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "/meal-detail";

  Widget setSelectedTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(title, style: Theme.of(context).textTheme.title),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        width: 300,
        height: 200,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealItem = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });
    return Scaffold(
        appBar: AppBar(
          title: Text("${mealItem.title}"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              height: 200,
              width: double.infinity,
              child: Image.network(mealItem.imageUrl, fit: BoxFit.cover),
            ),
            setSelectedTitle(context, mealItem.title),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text("${mealItem.ingredients[index]}")));
                },
                itemCount: mealItem.ingredients.length,
              ),
            ),
            setSelectedTitle(context, "Steps"),
            buildContainer(ListView.builder(
                itemBuilder: (ctx, index) => Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text("# ${index + 1}"),
                          ),
                          title: Text(mealItem.steps[index]),
                        ),
                        Divider()
                      ],
                    ),
                itemCount: mealItem.steps.length))
          ],
        )),
        floatingActionButton:
            FloatingActionButton(child: Icon(Icons.add), onPressed: () {
              Navigator.of(context).pop(mealId);
            }));
  }
}
