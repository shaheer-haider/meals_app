import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_categories.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map;
    final categoryMeals = dummyMeals.where((meal) {
      return meal.id == routeArgs['id'];
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryMeals[0].title),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            margin: const EdgeInsets.all(0),
            shadowColor: Colors.pink.withOpacity(0.3),
            elevation: 8,
            child: Stack(
              children: [
                Container(
                  color: Colors.pink.withOpacity(0.3),
                  width: double.infinity,
                  height: 300,
                ),
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1000),
                    child: Image.network(
                      categoryMeals[0].imageUrl,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IngredientsAndSteps(
            title: "Ingredients",
            steps: categoryMeals[0].ingredients,
            stepsColor: Colors.amber.withOpacity(0.8),
          ),
          IngredientsAndSteps(
            title: "Steps",
            steps: categoryMeals[0].steps,
            stepsColor: Colors.pink.withOpacity(0.8),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.star_border),
        backgroundColor: Theme.of(context).colorScheme.primary,
        mini: true,
      ),
    );
  }
}

class IngredientsAndSteps extends StatelessWidget {
  final String title;
  final List<String> steps;
  final Color stepsColor;
  const IngredientsAndSteps({
    required this.title,
    required this.steps,
    required this.stepsColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return Container(
      height: 275,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black),
              ),
            ),
            width: double.infinity,
            padding: const EdgeInsets.only(top: 9, bottom: 5),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          SizedBox(
            height: 210,
            child: ListView(
              controller: controller,
              children: [
                ...steps
                    .map(
                      (text) => Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 7,
                          ),
                          decoration: BoxDecoration(
                            color: stepsColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "${(title == "Steps") ? ('Step ' '${steps.indexOf(text) + 1}' ' :') : ""}  $text",
                            style: Theme.of(context).textTheme.subtitle2,
                          )),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
