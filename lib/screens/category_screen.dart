import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
import '../widgets/drawer.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('10 Recipes'),
        centerTitle: true,
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((dData) {
          return InkWell(
            onTap: () => Navigator.of(context).pushNamed('meals', arguments: {
              'id': dData.id,
              'title': dData.title,
              'color': dData.color
            }),
            splashColor: dData.color.withOpacity(0.5),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      dData.color.withOpacity(0.5),
                      dData.color,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
              padding: const EdgeInsets.all(17),
              margin: const EdgeInsets.all(5),
              child: Text(
                dData.title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          );
        }).toList(),
      ),
      drawerScrimColor: Colors.grey.withOpacity(0.5),
      drawerEnableOpenDragGesture: false,
      drawerEdgeDragWidth: 200,
      drawer: BuildDrawer(),
    );
  }
}
