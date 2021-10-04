import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, {onTap}) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(title),
      onTap: onTap,
    );
  }

  const AppDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 125,
            alignment: Alignment.centerLeft,
            color: Colors.grey.shade900,
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Text(
              "Categories",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontSize: 24,
                    color: Colors.white,
                  ),
            ),
          ),
          buildListTile(
            "Meals",
            Icons.restaurant,
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          buildListTile(
            "Filters",
            Icons.settings,
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/filters");
            },
          ),
        ],
      ),
    );
  }
}
