import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/meal_entity.dart';

class DayMeals extends StatelessWidget {
  final List<MealEntity> KSCMeals;
  final List<MealEntity> AwbaraMeals;
  DayMeals({required this.KSCMeals, required this.AwbaraMeals});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height* 0.69,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: KSCMeals.length + AwbaraMeals.length,
        itemBuilder: (BuildContext context, int index) {
          if (index < KSCMeals.length) {
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              height: 55,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: AutoSizeText(
                '${KSCMeals[index].meal}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onTertiary,
                  overflow: TextOverflow.fade,
                ),
              ),
            );
          } else {
            final AwbaraIndex = index - KSCMeals.length;
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              height: 55,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: AutoSizeText(
                '${AwbaraMeals[AwbaraIndex].meal}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onTertiary,
                  overflow: TextOverflow.fade,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
