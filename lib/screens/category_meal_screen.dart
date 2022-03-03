import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/main.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'category_meals';
  // final List<Meal> availableMeals ;

  const CategoryMealScreen({Key? key}) : super(key: key);
  @override
  displayedMealcreenState createState() => displayedMealcreenState();
}

class displayedMealcreenState extends State<CategoryMealScreen> {

  String? categoryTitle;
  List<Meal>? displayedMeal;
  // we put these codes in initState to make the list
  // loading fast because we will need it in a lot of things
    @override
  void didChangeDependencies() {
      // get the arguments that has been send by route
      final routArg =
      ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final _categoryId = routArg['id'];
      categoryTitle = routArg['title'];
      // it will go through all meals and return the meal
      // that has the same id of the id of my argId
      displayedMeal = MyApp.availableMeals.where((meal) {
        return meal.categories.contains(_categoryId);
      }).toList();
    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId){
  //   setState(() {
  //     displayedMeal!.removeWhere((meal) => meal.id == mealId);
  //   });
  // }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeal![index].id,
            title: displayedMeal![index].title,
            imageUrl: displayedMeal![index].imageUrl,
            duration: displayedMeal![index].duration,
            complexity: displayedMeal![index].complexity,
            affordability: displayedMeal![index].affordability,
          );
        },
        itemCount: displayedMeal!.length,
      ),
    );
  }
}
