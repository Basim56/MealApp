import 'package:flutter/material.dart';
import 'package:meal_appv2/models/category.dart';
import 'package:meal_appv2/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    this.title,
  });
  final List<Meal> meals;
  final String? title;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Try selecting a new category!',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: ((context, index) => MealItem(
                meal: meals[index],
              )));
    }
    if (title == null) {
      return content;
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(title!),
          ),
          body: content);
    }
  }
}
