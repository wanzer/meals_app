import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {

  static const String filterRout = '/filter-route';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filter"),),
      body: Center(child: Text("Filter"),),
    );
  }
}