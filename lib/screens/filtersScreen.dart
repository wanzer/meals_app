import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {

  static const String filterRout = '/filter-route';
  Function filter;

  Map<String, bool> _currentFilters;

  FiltersScreen(this._currentFilters, this.filter);

  @override
  FiltersScreenState createState() => FiltersScreenState();
}

class FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    bool _glutenFree = false;
    bool _lactoseFree = false;
    bool _vegan = false;
    bool _vegetarian = false;

    @override
    initState(){
      _glutenFree = widget._currentFilters['gluten'];
      _lactoseFree = widget._currentFilters['lactose'];
      _vegan = widget._currentFilters['vegan'];
      _vegetarian = widget._currentFilters['vegetarian'];
      super.initState();
    }

    Widget _buildSwitchListTile(String title, String subTitle,
        bool currentValue, Function updateValue) {
      return SwitchListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        value: currentValue,
        onChanged: updateValue,
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Filter"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.filter), onPressed: (){
              Map<String, bool> _filters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };
              widget.filter(_filters);
            })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text("Adjust your meal selection",
                    style: Theme.of(context).textTheme.title)),
            Expanded(
                child: ListView(
              children: <Widget>[
                _buildSwitchListTile("Gluten-free",
                    "Only include gluteen-free meals", _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile("Lactose-free",
                    "Only include lactose-free meals", _lactoseFree, (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                _buildSwitchListTile("Vegan-free",
                    "Only include vegan-free meals", _vegan, (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
                _buildSwitchListTile("Vegetarian-free",
                    "Only include Vegetarian-free meals", _vegetarian, (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    })
              ],
            ))
          ],
        ));
  }
}
