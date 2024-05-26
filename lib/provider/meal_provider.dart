import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/categories_model.dart';

final mealsprovider=Provider((ref){
  return dummyMeals;
});