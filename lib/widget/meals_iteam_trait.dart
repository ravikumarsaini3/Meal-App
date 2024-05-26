import 'package:flutter/material.dart';

class MealsIteamTrait extends StatelessWidget {
  const MealsIteamTrait({super.key, required this.icon, required this.lable});
  final IconData icon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          lable,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
