import 'package:flutter/material.dart';
import 'package:meals_app/model/categories_model.dart';
import 'package:meals_app/screen/mealsdetails_screen.dart';

import 'package:meals_app/widget/meals_iteam_trait.dart';

class MealsItem extends StatelessWidget {
  final void Function(Meal meal) ontoggle;

  const MealsItem({
    super.key,
    required this.meal,
    required this.ontoggle,
  });
  final Meal meal;

  String get Complexity {
    return meal.complexity.name[0] + meal.complexity.name.substring(1);
  }

  String get afoordabilitytext {
    return meal.affordability.name[0] + meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.green,
        focusColor: Colors.red,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MealsdetailsScreen(
                        meal: meal,
                        ontoggle: ontoggle,
                      )));
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: Image.asset(meal.imageUrl)),
            Positioned(
                left: 0,
                right: 0,
                //top: 0,
                bottom: 0,
                child: Container(
                  color: Colors.black54,
                  // height: 250,
                  //  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealsIteamTrait(
                              icon: Icons.schedule,
                              lable: '${meal.duration} min'),
                          const SizedBox(
                            width: 5,
                          ),
                          MealsIteamTrait(icon: Icons.work, lable: Complexity),
                          const SizedBox(
                            width: 5,
                          ),
                          MealsIteamTrait(
                              icon: Icons.attach_money_sharp,
                              lable: afoordabilitytext)
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
