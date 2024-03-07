import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_appv2/models/category.dart';
import 'package:meal_appv2/provider/filters_provider.dart';
import 'package:meal_appv2/screens/categories.dart';
import 'package:meal_appv2/screens/filters.dart';
import 'package:meal_appv2/screens/meals.dart';
import 'package:meal_appv2/widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  var _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  void _setScreen(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setDrawer(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => FiltersScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredAvailableMeals = ref.watch(favoritesMealsProvider);
    Widget activeScreen = CategoriesScreen(
      availableMeals: filteredAvailableMeals,
    );
    var activetitle = 'Pick Your Category';
    if (_selectedPageIndex == 1) {
      activeScreen = MealsScreen(
        meals: _favoriteMeals,
      );
      activetitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activetitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setDrawer,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _setScreen(index);
        },
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
