import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  ListTile buildListTile(
      String _title, IconData _icon, Object Function() _tabHandler) {
    return ListTile(
      leading: Icon(
        _icon,
        size: 26,
      ),
      title: Text(
        _title,
        style: const TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: _tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 75,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: const Text(
              "Cooking up",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Color.fromRGBO(255, 254, 229, 1),
              ),
            ),
          ),
          const SizedBox(height: 20),
          buildListTile(
            'meal',
            Icons.restaurant,
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          buildListTile(
            'Filters',
            Icons.settings,
            () => Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName),
          ),
        ],
      ),
    );
  }
}
