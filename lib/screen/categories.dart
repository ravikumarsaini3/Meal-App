import 'package:flutter/material.dart';

import 'package:meals_app/model/categories_model.dart';
import 'package:meals_app/screen/meals.dart';

import 'package:meals_app/widget/categoary_item.dart';

// ignore: camel_case_types
class Categories_screen extends StatefulWidget {
  final void Function(Meal meal) ontoggle;

  const Categories_screen({
    super.key,
    required this.availablemeals,
    required this.ontoggle,
  });
  final List<Meal> availablemeals;

  @override
  State<Categories_screen> createState() => _Categories_screenState();
}

class _Categories_screenState extends State<Categories_screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animationController.forward();
  }

  void _selectcategory(BuildContext context, Categoryy catagory) {
    final filterlist = widget.availablemeals
        .where(
          (meal) => meal.categories.contains(catagory.id),
        )
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return Meals(
          meal: filterlist,
          ontoggle: widget.ontoggle,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context,
              child) => /*Padding(
              padding:
                  EdgeInsets.only(top: 100 - _animationController.value * 100),
              child: child,
            )*/

          SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0.0, 0.0),
        ).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.ease),
        ),
        child: child,
      ),
      child: GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children:
              /* we can also use for in loop 
          for (final Categoryy in availablecategoray)
            categoary_item(category: Categoryy),*/

              availableCategories.map(
            (category) {
              return categoary_item(
                category: category,
                onselectcategory: () {
                  _selectcategory(context, category);
                },
              );
            },
          ).toList()),
    );
  }
}
