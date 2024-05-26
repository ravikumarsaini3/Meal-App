import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/categories_model.dart';
import 'package:meals_app/widget/favouriteprovider.dart';

class MealsdetailsScreen extends ConsumerWidget {
  final void Function(Meal meal) ontoggle;

  const MealsdetailsScreen({
    super.key,
    required this.meal,
    required this.ontoggle,
  });
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool isicon = false;
    // Icon icon = Icon(Icons.add);
    final favouritemeal = ref.watch(mealprovider);
    final isfavourite = favouritemeal.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                ontoggle(meal);

                /* final wasadded = ref.read(mealprovider.notifier).toggle(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(wasadded
                        ? " meal mark a favourite"
                        : " no longer favourite meal available ")));*/
              },
              icon: Icon(isfavourite ? Icons.star_border : Icons.star))
          //  icon: Icon(Icons.star_border))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 8, 17, 25),
          Color.fromARGB(255, 44, 31, 13)
        ])),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Hero(tag: meal.id, child: Image.asset(meal.imageUrl))),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              for (final ingredients in meal.ingredients)
                Text(
                  ingredients,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Steps',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              for (final steps in meal.steps)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    steps,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
