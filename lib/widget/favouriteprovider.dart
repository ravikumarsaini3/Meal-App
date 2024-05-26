import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/categories_model.dart';

class Favouriteprovider extends StateNotifier<List<Meal>> {
  Favouriteprovider() : super([]);
  bool toggle(Meal meal) {
    final isfavourite = state.contains(meal);
    if (isfavourite) {
      state = state
          .where(
            (element) => element.id != meal.id,
          )
          .toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final mealprovider = StateNotifierProvider<Favouriteprovider, List<Meal>>(
  (ref) {
    return Favouriteprovider();
  },
);
