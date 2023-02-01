import 'package:flutter/material.dart';
import '../widgets/card list.dart';
import '../main.dart';
import '../widgets/drawer.dart';
class Favorite extends StatefulWidget {

  @override
  State<Favorite> createState() => _FavoriteState();
}
class _FavoriteState extends State<Favorite> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
        centerTitle: true,
      ),
      body: favoriteMeals.isEmpty
          ? const Center(
              child: Text('There is no items in the favorite list yet'))
          : MealList1(favoriteMeals.toList(), Colors.deepPurple, 1),
      drawerScrimColor: Colors.grey.withOpacity(0.5),
      drawerEnableOpenDragGesture: false,
      drawerEdgeDragWidth: 200,
      drawer: BuildDrawer(),
    );
  }
}
