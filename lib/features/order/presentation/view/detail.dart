import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/injection/injection_container.dart';
import '../logic/cubit/get_all_orders_cubit.dart';

class detail extends StatelessWidget {
  int index;
  String mealName;
  String restaurant;
  String uType;
  detail(
      {required this.mealName,
      required this.index,
      required this.restaurant,
      required this.uType});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "${index + 1} -",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
          ),
        ),
        Text(
          mealName,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        BlocProvider(
          create: (context) => sl<GetAllOrdersCubit>()..fetchOrders(),
          child: BlocBuilder<GetAllOrdersCubit, GetAllOrdersState>(
            builder: (context, state) {
              return state.when(
                getAllOrdersInitial: () => const CircularProgressIndicator(),
                loadingGetAllOrdersState: () =>
                    const CircularProgressIndicator(),
                errorGetAllOrdersState: (message) =>
                    Center(child: Text(message)),
                loadedGetAllOrdersState: (orders) {
                  final now = DateTime.now();
                  final DateFormat formatter = DateFormat('yyyy-MM-dd');
                  final String formattedDate = formatter.format(now);
                  String monthYear = DateFormat.yM()
                      .format(DateTime.now())
                      .split('/')
                      .reversed
                      .join('-');
                  final Map<String, dynamic> restaurantOrders = (uType == 'hq')
                      ? orders[restaurant]
                      : (uType == 'ksc' || uType == 'awbara')
                          ? orders[monthYear]
                          : orders[monthYear] ?? {};

                  final List<dynamic> allOrders = (uType == 'hq')
                      ? restaurantOrders.values
                          .expand((orders) => orders.values)
                          .toList()
                      : restaurantOrders.values.toList();
                  final List<dynamic> todayOrders = allOrders
                      .where((order) =>
                          order['order_date'] == formattedDate &&
                          order['meal_des'] == mealName)
                      .toList();

                 
                  if (todayOrders.isEmpty) {
                    return Text('No orders available yet');
                  }

                  final Map<String, Map<String, int>> mealOrderCounts = {};
                  for (final order in todayOrders) {
                    final String department = order['user_department'] ?? '';
                    final String meal = order['meal_des'] ?? '';

                    if (department.isEmpty || meal.isEmpty) continue;

                    final Map<String, int> mealCounts =
                        mealOrderCounts.putIfAbsent(
                      department,
                      () => {},
                    );

                    final int count = mealCounts.putIfAbsent(meal, () => 0);
                    mealCounts[meal] = count + 1;
                  }

                  // Build a list of widgets to display the department and meal order counts for today's date
                  final List<Widget> departmentWidgets = [];
                  for (final department in mealOrderCounts.keys) {
                    final Map<String, int> mealCounts =
                        mealOrderCounts[department] ?? {};

                    departmentWidgets.add(Text('Department: $department'));

                    for (final meal in mealCounts.keys) {
                      final int count = mealCounts[meal] ?? 0;
                      departmentWidgets.add(Text('$meal: $count orders'));
                    }
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: departmentWidgets,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
