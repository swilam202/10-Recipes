import 'package:flutter/material.dart';
import 'package:meal/main.dart';
import '../data controller.dart';
import '../widgets/drawer.dart';
import 'package:get/get.dart';



bool glutenFree = false;
bool lactoseFree = false;
bool vegan = false;
bool vegetarian = false;

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String setFilterForSnack = '';
  DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => setState(() {
              controller.filtered.value['gluten'] = glutenFree;
              controller.filtered.value['lactose'] = lactoseFree;
              controller.filtered.value['vegan'] = vegan;
              controller.filtered.value['vegetarian'] = vegetarian;

              if (glutenFree) controller.filterCount.value++;
              if (lactoseFree) controller.filterCount.value++;
              if (vegan) controller.filterCount.value++;
              if (vegetarian) controller.filterCount.value++;

              if (!glutenFree && !lactoseFree && !vegan && !vegetarian)
                setFilterForSnack = 'No Filters applied!';
              else if (controller.filterCount.value == 1)
                setFilterForSnack = '1 Filter was applied!';
              else
                setFilterForSnack = '${controller.filterCount.value}Filters were applied!';
              controller.filterCount.value = 0;
              controller.setFilter();

              Get.snackbar('Note', setFilterForSnack,snackPosition: SnackPosition.BOTTOM,icon: const Icon(Icons.filter_list_alt,color: Colors.blue,size: 30,),colorText: Colors.blue);
            }),
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        children: [
          ExpansionTile(
            title: const Text(
              'Filters',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            leading: const Icon(
              Icons.filter_alt,
              size: 30,
            ),
            children: [
              SwitchListTile(
                title: const Text(
                  'Gluten',
                  style: TextStyle(
                    fontSize: 26.52,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text('This filter to get free gluten meals'),
                value: glutenFree,
                onChanged: (val) {
                  setState(() => glutenFree = val);
                },
              ),
              const Divider(
                thickness: 4,
                endIndent: 40,
                indent: 40,
              ),
              SwitchListTile(
                title: const Text(
                  'Lactose',
                  style: TextStyle(
                    fontSize: 26.52,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text('This filter to get free Lactose meals'),
                value: lactoseFree,
                onChanged: (val) {
                  setState(() => lactoseFree = val);
                },
              ),
              const Divider(
                thickness: 4,
                endIndent: 40,
                indent: 40,
              ),
              SwitchListTile(
                title: const Text(
                  'Vegan',
                  style: TextStyle(
                    fontSize: 26.52,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text('This filter to get vegan meals'),
                value: vegan,
                onChanged: (val) {
                  setState(() => vegan = val);
                },
              ),
              const Divider(
                thickness: 4,
                endIndent: 40,
                indent: 40,
              ),
              SwitchListTile(
                title: const Text(
                  'Vegetarian',
                  style: TextStyle(
                    fontSize: 26.52,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text('This filter to get Vegetarian meals'),
                value: vegetarian,
                onChanged: (val) {
                  setState(() => vegetarian = val);
                },
              ),
            ],
          ),
        ],
      ),
      drawerScrimColor: Colors.grey.withOpacity(0.5),
      drawerEnableOpenDragGesture: false,
      drawerEdgeDragWidth: 200,
      drawer: BuildDrawer(),
    );
  }
}
