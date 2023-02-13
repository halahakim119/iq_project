import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/meal_entity.dart';

class DayMeals extends StatelessWidget {
  List<MealEntity> Meals;
  DayMeals(this.Meals);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: Meals.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 25),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(20.0),

            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(5, 5),
              ),
            ],
            color: Theme.of(context).colorScheme.onSecondary,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: AutoSizeText(
            '${Meals[index].meal}',
            style: TextStyle(color: Theme.of(context).colorScheme.onTertiary),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 15,
        );
      },
    );
  }
}
