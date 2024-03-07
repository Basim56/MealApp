import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_appv2/models/category.dart';

class FavoritesNotifier extends StateNotifier<List<Meal>> {
  FavoritesNotifier() : super([]);

  bool toggleFavortieStatus(Meal meal) {
    var isExisting = state.contains(meal);
    if (isExisting) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, List<Meal>>(
    (ref) => FavoritesNotifier());
