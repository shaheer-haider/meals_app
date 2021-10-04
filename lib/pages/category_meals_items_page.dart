import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_categories.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMeals extends StatelessWidget {
  const CategoryMeals({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map;
    final categoryId = routeArgs['id'];

    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[
                routeArgs['color'].withOpacity(0.7),
                routeArgs['color']
              ])),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                imageUrl: categoryMeals[index].imageUrl,
                affordability: categoryMeals[index].affordability,
              );
            },
            itemCount: categoryMeals.length,
          ),
        ),
      ),
    );
  }
}
