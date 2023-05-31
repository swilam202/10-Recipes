import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal/main.dart';

import '../data controller.dart';

class MealDetails extends StatefulWidget {
  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  Widget barrier(int len1, int len2) {
    if (len1 != len2) {
      return const Divider(
        thickness: 5,
        indent: 30,
        endIndent: 30,
      );
    } else {
      return Container();
    }
  }

  DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    final Map i = ModalRoute.of(context)!.settings.arguments as Map;
    final String argi = i['id'];
    final Color argColor = i['color'];
    final int x = i['pos'];
    final filteredMeal =
    controller.filteredMeals.firstWhere((element) => element.id == argi);

    return Scaffold(
      appBar: AppBar(
        title: Text(filteredMeal.title),
        centerTitle: true,
        backgroundColor: argColor,
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            width: double.infinity,
            height: 280,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage(filteredMeal.imageUrl),
                )),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Ingredients',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: filteredMeal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.amberAccent.withOpacity(0.9),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        filteredMeal.ingredients[index],
                        style: const TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              )),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Steps',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
            ),
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: filteredMeal.steps.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: argColor,
                        foregroundColor: Colors.white,
                        child: Text('${index + 1}'),
                      ),
                      title: Text(
                        filteredMeal.steps[index],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    barrier(filteredMeal.steps.length, index + 1),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: argColor,
          child: Icon(
            controller.favIcon(filteredMeal.id),
            color: Colors.yellow,
          ),
          onPressed: () {
            setState(() {
              controller.fetchFavorite(filteredMeal.id);
              controller.favIcon(filteredMeal.id);
              if (controller.favIcon(filteredMeal.id) == Icons.star_border && x == 1)
                Navigator.of(context).pop(filteredMeal.id);
            });
          }),
    );
  }
}
