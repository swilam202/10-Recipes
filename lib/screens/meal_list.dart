import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data controller.dart';
import '../widgets/card list.dart';
import '../main.dart';
import '../widgets/drawer.dart';

class MealList extends StatefulWidget {
  @override
  State<MealList> createState() => _MealListState();
}

class _MealListState extends State<MealList> {
  var argTitle;

  var argColor;

  DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final String argId = args['id'];
    argColor = args['color'];
    argTitle = args['title'];
    List filteredData = controller.filteredMeals.where((element) {
      return element.categories.contains(argId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(argTitle),
        backgroundColor: argColor,
      ),
      body: MealList1(filteredData, argColor, 0),
      drawerScrimColor: Colors.grey.withOpacity(.5),
      drawerEnableOpenDragGesture: false,
      drawerEdgeDragWidth: 200,
      drawer: BuildDrawer(),
    );
  }
}
