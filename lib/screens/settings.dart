import 'package:flutter/material.dart';
import 'package:meal/main.dart';
import '../widgets/drawer.dart';

Map filtered = {
  'gluten': false,
  'lactose': false,
  'vegan': false,
  'vegetarian': false,
};

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
  int filterCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => setState(() {
              filtered['gluten'] = glutenFree;
              filtered['lactose'] = lactoseFree;
              filtered['vegan'] = vegan;
              filtered['vegetarian'] = vegetarian;

              if (glutenFree) filterCount++;
              if (lactoseFree) filterCount++;
              if (vegan) filterCount++;
              if (vegetarian) filterCount++;

              if (!glutenFree && !lactoseFree && !vegan && !vegetarian)
                setFilterForSnack = 'No Filters applied!';
              else if (filterCount == 1)
                setFilterForSnack = '1 Filter was applied!';
              else
                setFilterForSnack = '$filterCount Filters were applied!';
              filterCount = 0;
              setFilter();
              SnackBar snack = SnackBar(
                content: Text(
                  setFilterForSnack,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontStyle: FontStyle.italic),
                ),
                duration: const Duration(seconds: 3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                backgroundColor: Colors.deepPurple,
              );
              ScaffoldMessenger.of(context).showSnackBar(snack);
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
