import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {

  final String title;
  final Color color;

  CategoryItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Text(title, style: Theme.of(context).textTheme.title),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.75), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),borderRadius: BorderRadius.all(Radius.circular(5.0))),
    );
  }
}
