
import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key, required this.onselectscreen});
  final void Function(String identifier)onselectscreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blueGrey, Colors.cyanAccent])),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Cooking UP',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onselectscreen('meals');
            },
            leading: Icon(
              Icons.restaurant,
              color: Theme.of(context).hintColor,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {
              onselectscreen('filters');
      },
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).hintColor,
            ),
            title: Text(
              'filters',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
