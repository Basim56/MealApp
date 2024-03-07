import 'package:flutter/material.dart';
import 'package:meal_appv2/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.setScreen});
  final void Function(BuildContext context, Category category) setScreen;
  final Category category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setScreen(context, category);
      },
      borderRadius: BorderRadius.circular(9),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.86),
              category.color.withOpacity(0.09),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(9)),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
