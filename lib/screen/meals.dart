import 'package:flutter/material.dart';

import 'package:meals_app/model/categories_model.dart';
import 'package:meals_app/widget/meals_item.dart';

class Meals extends StatelessWidget {
  final void Function(Meal meal) ontoggle;
 
  const Meals({
    super.key,
    required this.meal,
    this.title,
    required this.ontoggle, 
  });
  final String? title;
  final List<Meal> meal;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      shrinkWrap: true,
      itemCount: meal.length,
      itemBuilder: (context, index) {
        return MealsItem(
        
          meal: meal[index],
          ontoggle: ontoggle,
        );
      },
    );

    if (meal.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('oh..no.. Nothing hare ..',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer)),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Try Selecting a different catagory',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primaryContainer),
            )
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
