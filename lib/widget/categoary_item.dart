import 'package:flutter/material.dart';
import 'package:meals_app/model/categories_model.dart';


class categoary_item extends StatelessWidget {
  final Categoryy category;
  final void Function() onselectcategory;
  const categoary_item({super.key, required this.category, required this.onselectcategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        focusColor: Colors.white,
        // splashColor: Theme.of(context).primaryColor,
        onTap: onselectcategory,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  category.color.withOpacity(.9),
                  category.color.withOpacity(.5),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
              )),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              category.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(),
            ),
          ),
        ),
      ),
    );
  }
}
