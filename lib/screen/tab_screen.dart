import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/categories_model.dart';

import 'package:meals_app/screen/categories.dart';
import 'package:meals_app/screen/drawer.dart';
import 'package:meals_app/screen/filterscreen.dart';
import 'package:meals_app/screen/meals.dart';

const KinitialFilter = {
  Filters.glutenfree: false,
  Filters.lactoseFree: false,
  Filters.vagetarien: false,
  Filters.vegen: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  // ignore: non_constant_identifier_names
  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
 
  int pageindex = 0;

  Map<Filters, bool> _selectfilter = KinitialFilter;

  void showsnakbar(String text) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(duration: const Duration(seconds: 3), content: Text(text)));
  }

  final List<Meal> favouritemeal = [];
  void toggle(Meal meal) {
    final isexits = favouritemeal.contains(meal);
    if (isexits) {
      favouritemeal.remove(meal);
      showsnakbar('Meal is No longer favourite ...');

      setState(() {});
    } else {
      favouritemeal.add(meal);
      showsnakbar('Marked as favourite ...');

      setState(() {});
    }
  }

  void selectscreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      var result = await Navigator.push<Map<Filters, bool>>(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Filterscreen(
              currentfilter: _selectfilter,
            );
          },
        ),
      );
      setState(() {
        _selectfilter = result ?? KinitialFilter;
      });
    }
  }

  void _selectpageindex(int index) {
    setState(() {
      pageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final meals = ref.watch(mealsprovider);
    final availablemeals = dummyMeals.where((meal) {
      if (_selectfilter[Filters.glutenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectfilter[Filters.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectfilter[Filters.vagetarien]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectfilter[Filters.vegen]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activescreen = Categories_screen(
    
      availablemeals: availablemeals,
      ontoggle: toggle,
    );
    String activescreen_title = 'Categories';
    if (pageindex == 1) {
      //  final favouritemeal = ref.watch(mealsprovider);
      activescreen = Meals(
        meal: favouritemeal,
        ontoggle: toggle,
        
      );
      activescreen_title = ' Your Favourite';
    }

    return Scaffold(
        appBar: AppBar(title: Text(activescreen_title)),
        drawer: MyDrawer(
          onselectscreen: selectscreen,
        ),
        body: activescreen,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageindex,
          onTap: _selectpageindex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal_rounded), label: 'categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: ' Favourite'),
          ],
        ));
  }
}
