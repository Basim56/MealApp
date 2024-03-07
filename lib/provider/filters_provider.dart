import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_appv2/provider/meals_provider.dart';
import 'package:meal_appv2/screens/filters.dart';

class FiltersNotifier extends StateNotifier<Map<filters, bool>> {
  FiltersNotifier()
      : super({
          filters.glutenFree: false,
          filters.lactoseFree: false,
          filters.vegetarian: false,
          filters.vegan: false,
        });

  void setFilters(Map<filters, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(filters filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<filters, bool>>(
        (ref) => FiltersNotifier());
final favoritesMealsProvider = Provider((ref) {
  var meals = ref.watch(mealsProvider);
  var _selectedFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (_selectedFilters[filters.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (_selectedFilters[filters.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (_selectedFilters[filters.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (_selectedFilters[filters.vegan]! && !meal.isVegan) {
      return false;
    }

    return true;
  }).toList();
});
