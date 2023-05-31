import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'dummy_data.dart';

class DataController extends GetxController{
  RxList favorite = [].obs;
  List filteredMeals = DUMMY_MEALS;
  RxInt filterCount = 0.obs;

  RxMap filtered = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  }.obs;

  fetchFavorite(String id) {
    int isThere = favorite.value.indexWhere((element) => element.id == id);
    if (isThere > -1) {
      favorite.value.removeAt(isThere);
      favorite.value.removeWhere((element) => element.id == id);
    } else {
      favorite.value.add(DUMMY_MEALS.firstWhere((element) => element.id == id));
    }
  }

  IconData favIcon(String id) {
    if (favorite.any((element) => element.id == id))
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

}