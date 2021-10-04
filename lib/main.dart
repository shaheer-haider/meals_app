import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/pages/categories.dart';
import 'package:meals_app/pages/category_meals_items_page.dart';
import 'package:meals_app/pages/filters.dart';
import 'package:meals_app/pages/meal_details.dart';
import 'package:meals_app/pages/navigation_tabs.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meals Days",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              subtitle1: const TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
              ),
              subtitle2: const TextStyle(
                fontSize: 14,
                fontFamily: "Raleway",
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const NavigationTab(),
        '/category': (ctx) => const CategoryMeals(),
        '/meal-details': (ctx) => const MealDetails(),
        '/filters': (ctx) => const Filters(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const Categories();
          },
        );
      },
    );
  }
}
