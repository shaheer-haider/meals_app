import 'package:flutter/material.dart';
import 'package:meals_app/pages/favorites.dart';
import 'package:meals_app/widgets/app_drawer.dart';

import 'categories.dart';

class NavigationTab extends StatefulWidget {
  const NavigationTab({Key? key}) : super(key: key);

  @override
  State<NavigationTab> createState() => _NavigationTabState();
}

class _NavigationTabState extends State<NavigationTab> {
  final _pages = [const Categories(), const Favorites()];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color mostColor = _selectedPageIndex == 0
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.secondary;
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedPageIndex == 0 ? "Categories" : "Favorite Meals"),
        backgroundColor: mostColor,
      ),
      drawer: const AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: (_selectedPageIndex == 0
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary),
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.category),
              label: "Categories"),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            icon: const Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
      body: _pages[_selectedPageIndex],
    );
  }
}
