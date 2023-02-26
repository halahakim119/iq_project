import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_project/features/Kitchen/schedule_management/presentation/logic/get_all_meals_bloc/bloc/get_all_meals_bloc.dart';

import '../../../../../../core/injection/injection_container.dart';
import '../../logic/add_delete_meal_bloc/add_delete_meal_bloc.dart';

class MealsList extends StatelessWidget {
  var selectedDay;
  MealsList({
    required this.selectedDay,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllMealsBloc>(
      create: (context) => sl<GetAllMealsBloc>()..add(GetMealsEvent()),
      child: BlocBuilder<GetAllMealsBloc, GetAllMealsState>(
        builder: (context, state) {
          if (state is LoadingGetAllMealsState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ErrorGetAllMealsState) {
            return Center(child: Text(state.message));
          } else if (state is LoadedGetAllMealsState) {
            final meals = state.meals;
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 0.3,
              ),
              itemCount: meals.length,
              itemBuilder: (BuildContext context, int index) {
                final meal = meals.values.elementAt(index);
                return ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "${index + 1} -",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () async {
                      await sl<AddDeleteMealBloc>()
                          .deleteMealUsecase(meal['id'], selectedDay);
                    },
                  ),
                  title: Text(
                    meal['name'],
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                );
              },
            );
          } else if (state is MealsUpdatedState) {
            final meals = state.meals;
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 0.3,
              ),
              itemCount: meals.length,
              itemBuilder: (BuildContext context, int index) {
                final meal = meals.values.elementAt(index);
                return ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "${index + 1} -",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () async {
                      await sl<AddDeleteMealBloc>()
                          .deleteMealUsecase(meal['id'], selectedDay);
                    },
                  ),
                  title: Text(
                    meal['name'],
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No meals found!'));
          }
        },
      ),
    );
  }
}
