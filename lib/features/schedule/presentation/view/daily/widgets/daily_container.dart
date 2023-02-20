import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_project/features/order/data/models/order_model.dart';

import '../../../../../../core/injection/injection_container.dart' as di;
import '../../../../../../core/theme/custom_loading.dart';
import '../../../../../order/domain/entities/order_entity.dart';
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
      child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: _submitted
              ? BlocConsumer<OrderCubit, OrderState>(
                  listener: (context, state) {
                    state.maybeWhen(
                        loaded: () {
                          return Text(_selectedMeal);
                        },
                        error: (error) {
                          return Center(
                            child: Text(error),
                          );
                        },
                        orElse: () {});
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const CustomLoading(),
                      loaded: () {
                        return Text(_selectedMeal);
                      },
                      error: (error) {
                        return Center(
                          child: Text(error),
                        );
                      },
                      orElse: () {
                        return Container();
                      },
                    );
                  },
                )
              : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  Expanded(child: CustomDailyMealsKSC(chosenRestaurant.meals)),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: ElevatedButton(
                          onPressed: () {
                            CustomOrderedMealKSC(chosenRestaurant);

                            final OrderModel order = OrderModel(
                                mealID: selectedMealID,
                                restaurantID: selectedRestaurantID,
                                department: currentUser!.photoURL);

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
                      ))
                ])),
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

  void CustomOrderedMealKSC(order) {
    selectedRestaurantID = order.id.toString();
    selectedMealID = order.meals![_selectedIndex].id.toString();
    setState(() {
      _selectedMeal = order.meals![_selectedIndex].meal.toString();
      _submitted = true;
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
