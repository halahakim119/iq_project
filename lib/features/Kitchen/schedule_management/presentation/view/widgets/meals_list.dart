import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/injection/injection_container.dart';
import '../../logic/add_delete_meal_bloc/add_delete_meal_bloc.dart';

class MealsList extends StatelessWidget {
  var selectedDay;
  MealsList({
    required this.selectedDay,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDeleteMealBloc, AddDeleteMealState>(
      builder: (context, state) {
        if (state is LoadingAddDeleteMealState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is LoadedAddDeleteMealState) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              height: 1,
              thickness: 0.3,
            ),
            itemCount: state.meals.length,
            itemBuilder: (BuildContext context, int index) {
              List<dynamic> mealItems = state.meals.values.toList();
              String mealId = state.meals.keys.toList()[index];
              String mealName = mealItems[index].toString();

              return ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "${index + 1} -",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete,
                      color: Theme.of(context).colorScheme.primary),
                  onPressed: () async {
                    await sl<AddDeleteMealBloc>()
                        .deleteMealUsecase(mealId, selectedDay);
                  },
                ),
                title: Text(
                  mealName,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              );
            },
          );
        } else if (state is ErrorAddDeleteMealState) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text('No meals found.'));
        }
      },
    );
  }
}
