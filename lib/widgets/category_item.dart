import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({
    Key? key,
    required this.id,
    required this.title,
    required this.color,
  }) : super(key: key);

  void selectCategory(ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealScreen.routeName,
      ///send arguments
      arguments: {
        'id':id,
        'title':title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.4),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}