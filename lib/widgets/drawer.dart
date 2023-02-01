import 'package:flutter/material.dart';

class BuildDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(200))),
            child: const Center(
                child: Text(
              'Cook up!',
              style: TextStyle(
                  color: Colors.red, fontSize: 40, fontWeight: FontWeight.bold),
            )),
          ),
          const SizedBox(
            height: 50,
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              size: 30,
            ),
            onTap: () => Navigator.of(context).pushReplacementNamed('category'),
            title: const Text(
              'Meal',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 30,
            ),
            onTap: () => Navigator.of(context).pushReplacementNamed('set'),
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.favorite,
              size: 30,
            ),
            onTap: () => Navigator.of(context).pushReplacementNamed('fav'),
            title: const Text(
              'Favorite',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
