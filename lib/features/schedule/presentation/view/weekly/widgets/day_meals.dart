import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/meal_entity.dart';

class DayMeals extends StatelessWidget {
  List<MealEntity> Meals;
  DayMeals(this.Meals);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int columnCount = (constraints.maxWidth < 300) ? 1 : (constraints.maxWidth > 300 && constraints.maxWidth < 500)? 2:3;
        return GridView.count(
          shrinkWrap: true,
          crossAxisCount: columnCount,
          childAspectRatio: 1.5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(Meals.length, (index) {
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
               
                color: Theme.of(context).colorScheme.onSecondary,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: AutoSizeText(
                '${Meals[index].meal}',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onTertiary,
                    overflow: TextOverflow.fade),
              ),
            );
          }),
        );
      },
    );
  }
}
