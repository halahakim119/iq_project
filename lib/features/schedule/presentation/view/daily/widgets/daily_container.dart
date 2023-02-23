import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/injection/injection_container.dart' as di;
import '../../../../../order/data/models/order_model.dart';
import '../../../../../order/presentation/logic/cubit/order_cubit.dart';
import '../../../../domain/entities/schedule_entity.dart';

class DailyContainer extends StatefulWidget {
  int selectedDay;
  ScheduleEntity schedule;
  String restaurant;

  DailyContainer({
    required this.restaurant,
    required this.selectedDay,
    required this.schedule,
  });

  @override
  State<DailyContainer> createState() => _DailyContainerState();
}

class _DailyContainerState extends State<DailyContainer> {
  int _selectedIndex = 0;
  String _selectedMeal = '';
  bool _submitted = false;
  String selectedRestaurantID = '1';
  String selectedMealID = '1';
  final currentUser = FirebaseAuth.instance.currentUser;

  var day;
  var chosenRestaurant;

  @override
  Widget build(BuildContext context) {
    day = widget.selectedDay == 0
        ? widget.schedule.sunday
        : widget.selectedDay == 1
            ? widget.schedule.monday
            : widget.selectedDay == 2
                ? widget.schedule.tuesday
                : widget.selectedDay == 3
                    ? widget.schedule.wednesday
                    : widget.schedule.thursday;
    chosenRestaurant = widget.restaurant == 'ksc'
        ? day.ksc
        : widget.restaurant == 'awbara'
            ? day.awbara
            : day.awbara;
    return BlocProvider(
      create: (context) => di.sl<OrderCubit>(),
      child: BlocListener<OrderCubit, OrderState>(
        listener: (context, state) {},
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: Theme.of(context).colorScheme.primary),
            color: Theme.of(context).colorScheme.onSecondary,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: _submitted
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, bottom: 15, left: 30),
                      child: AutoSizeText(
                        'Selected meal:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onTertiary),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 30),
                      child: AutoSizeText(
                        _selectedMeal,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onTertiary),
                      ),
                    ),
                    BlocListener<OrderCubit, OrderState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          loaded: (id) {
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      di.sl<OrderCubit>().deleteOrder(
                                          id, currentUser!.photoURL!);
                                      setState(() {
                                        _submitted = false;
                                        _selectedMeal = '';
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(
                                          MediaQuery.of(context).size.width *
                                              0.35,
                                          50),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    child: AutoSizeText(
                                      'Delete',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          orElse: () {},
                        );
                      },
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, bottom: 15, left: 30),
                      child: AutoSizeText(
                        'Todays schedule',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onTertiary),
                      ),
                    ),
                    Expanded(
                        child: CustomDailyMealsKSC(chosenRestaurant.meals)),
                    Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: ElevatedButton(
                              onPressed: () {
                                submitCustomOrder(chosenRestaurant);
                                final OrderModel order = OrderModel(
                                    mealID: selectedMealID,
                                    restaurantID: selectedRestaurantID,
                                    department: currentUser!.photoURL!);
                        
                                di.sl<OrderCubit>().order(order);
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.7, 50),
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                              child: AutoSizeText(
                                'Submit',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.background),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
        ),
      ),
    );
  }

  Widget CustomDailyMealsKSC(meals) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return customRadioListTile(
            index,
            AutoSizeText(meals[index].meal.toString(),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onTertiary)));
      },
    );
  }

  void submitCustomOrder(order) {
    if (order.meals == null || order.meals!.isEmpty) {
      return;
    }
    if (_selectedIndex < 0 || _selectedIndex >= order.meals!.length) {
      return;
    }
    final selectedMeal = order.meals![_selectedIndex];
    selectedRestaurantID = order.id.toString();
    selectedMealID = selectedMeal.id.toString();
    setState(() {
      _selectedMeal = selectedMeal.meal.toString();
      _submitted = !_submitted;
    });
  }

  Widget customRadioListTile(index, text) {
    return RadioListTile(
      dense: true,
      activeColor: Theme.of(context).colorScheme.onTertiary,
      controlAffinity: ListTileControlAffinity.leading,
      title: text,
      value: index,
      groupValue: _selectedIndex,
      onChanged: (value) {
        setState(() {
          _selectedIndex = value!;
        });
      },
    );
  }
}
