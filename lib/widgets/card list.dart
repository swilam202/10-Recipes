import 'package:flutter/material.dart';
import 'package:meal/data%20controller.dart';
import '../main.dart';
import '../models/meal.dart';
import 'package:get/get.dart';

class MealList1 extends StatefulWidget {
  List availableList;
  Color barColor;
  int getx;

  MealList1(this.availableList, this.barColor, this.getx);

  @override
  State<MealList1> createState() => _MealList1State();
}

class _MealList1State extends State<MealList1> {
  IconData ico = Icons.star_border;

  @override
  Widget build(BuildContext context) {

    DataController controller = Get.put(DataController());

    String complex(Complexity com) {
      if (com == Complexity.Simple) {
        return 'Simple';
      } else if (com == Complexity.Challenging) {
        return 'Challenging';
      } else {
        return 'Hard';
      }
    }

    String affort(Affordability aff) {
      if (aff == Affordability.Affordable) {
        return 'Affordable';
      } else if (aff == Affordability.Luxurious) {
        return 'Luxurious';
      } else {
        return 'Pricey';
      }
    }

    void deleteElement(String id) {
      setState(() => controller.favorite.value.removeWhere((element) => element.id == id));
    }



    return ListView.builder(
      itemCount: widget.availableList.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            onTap: () => Navigator.of(context).pushNamed('details', arguments: {
              'id': widget.availableList[index].id,
              'color': widget.barColor,
              'pos': widget.getx,
            }).then((value) => deleteElement(value.toString())),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image.asset(
                        widget.availableList[index].imageUrl,
                        fit: BoxFit.cover,
                        height: 250,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      color: Colors.grey.withOpacity(0.7),
                      child: Text(
                        widget.availableList[index].title,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: const TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.timer),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('${widget.availableList[index].duration}'),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.leaderboard_rounded),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(complex(widget.availableList[index].complexity)),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.attach_money),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(affort(
                              widget.availableList[index].affordability)),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            controller.fetchFavorite(widget.availableList[index].id);
                            controller.favIcon(widget.availableList[index].id);
                          });
                        },
                        icon: Icon(
                          controller.favIcon(widget.availableList[index].id),
                          color: Colors.yellow,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
