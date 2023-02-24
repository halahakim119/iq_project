import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/meal_entity.dart';

class DayMeals extends StatelessWidget {
  final List<MealEntity> KSCMeals;
  final List<MealEntity> AwbaraMeals;
  DayMeals({required this.KSCMeals, required this.AwbaraMeals});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) =>
            (KSCMeals.length - 1) == index
                ? Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Awbara",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  )
                : const SizedBox(),
        itemCount: KSCMeals.length + AwbaraMeals.length,
        itemBuilder: (BuildContext context, int index) {
          if (index < KSCMeals.length) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                index == 0
                    ? Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "KSC",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      )
                    : const SizedBox(),
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: AutoSizeText(
                    '${KSCMeals[index].meal}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            );
          } else {
            final AwbaraIndex = index - KSCMeals.length;
            return Container(
              margin: const EdgeInsets.only(bottom: 2),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: AutoSizeText(
                '${AwbaraMeals[AwbaraIndex].meal}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
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
