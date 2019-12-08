import 'package:flutter/material.dart';
import '../screens/categoryMealScreen.dart';
import 'package:path/path.dart';

class CategoryItem extends StatelessWidget {

  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void openCategory(BuildContext context){

    Navigator.pushNamed(context, '/categories_screen', arguments: {'id':id, 'title':title});

    //basic navigation way
//    Navigator.push(context, MaterialPageRoute(builder: (_){
//      return CategoryMealScreen();
//      }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => openCategory(context),
        splashColor: Colors.amber,
        child:
      Container(
      padding: EdgeInsets.all(25),
      child: Text(title, style: Theme.of(context).textTheme.title),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.75), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),borderRadius: BorderRadius.all(Radius.circular(5.0))),
    )
    );
  }
}
