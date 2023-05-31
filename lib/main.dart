import 'package:flutter/material.dart';
import 'package:meal/data%20controller.dart';
import 'package:meal/dummy_data.dart';
import '../screens/meal_details.dart';
import '../screens/category_screen.dart';
import '../screens/meal_list.dart';
import '../screens/favorite.dart';
import '../screens/settings.dart';
import 'package:get/get.dart';





void main() {
  runApp(
    GetMaterialApp(
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
