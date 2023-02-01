import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
import '../screens/meal_details.dart';
import '../screens/category_screen.dart';
import '../screens/meal_list.dart';
import '../screens/favorite.dart';
import '../screens/settings.dart';

List filteredMeals = DUMMY_MEALS;
List favoriteMeals = [];

fetchFavorite(String id) {
  int isThere = favoriteMeals.indexWhere((element) => element.id == id);
  if (isThere > -1) {
    favoriteMeals.removeAt(isThere);
    favoriteMeals.removeWhere((element) => element.id == id);
  } else {
    favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == id));
  }
}

IconData favIcon(String id) {
  if (favoriteMeals.any((element) => element.id == id))
    return Icons.star;
  else
    return Icons.star_border;
}

void setFilter() {
  filteredMeals = DUMMY_MEALS.where((element) {
    if (filtered['gluten'] && !element.isGlutenFree) return false;
    if (filtered['lactose'] && !element.isLactoseFree) return false;
    if (filtered['vegan'] && !element.isVegan) return false;
    if (filtered['vegetarian'] && !element.isVegetarian) return false;

    return true;
  }).toList();
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryScreen(),
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 255, 200, 1),
        primarySwatch: Colors.deepPurple,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
      ),
      routes: {
        'category': (context) => CategoryScreen(),
        'meals': (context) => MealList(),
        'details': (context) => MealDetails(),
        'fav': (context) => Favorite(),
        'set': (context) => Settings(),
      },
    ),
  );
}
