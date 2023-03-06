import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/injection/injection_container.dart' as di;
import '../../../../../../core/injection/injection_container.dart';
import '../../../../../order/domain/entities/order_entity.dart';
import '../../../../../order/presentation/logic/bloc/add_delete_order_bloc.dart';

class DailyContainer extends StatefulWidget {
  int selectedDay;
  var schedule;
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
  String _selectedMeal = 'No meal selected';
  String _selectedRestaurant = 'ksc';
  bool _submitted = false;
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AddDeleteOrderBloc>(),
      child: Expanded(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: Theme.of(context).colorScheme.primary),
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: _submitted
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          AutoSizeText(
                            'Selected meal',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                          ),
                          const SizedBox(height: 20),
                          AutoSizeText(
                            _selectedMeal,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ElevatedButton(
                        onPressed: () async {
                          var delete = await sl<AddDeleteOrderBloc>()
                              .deleteOrderUsecase(widget.restaurant);

                          setState(() {
                            _selectedMeal = "";
                            delete.fold((l) => _submitted = true,
                                (r) => _submitted = false);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 40),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        child: AutoSizeText(
                          'Delete',
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                    )
                  ],
                )
              : Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        flex: 7,
                        child: CustomDailyMealsKSC(
                            widget.schedule[widget.selectedDay])),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_selectedMeal.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('select a meal')));

                            return;
                          }
                          setState(() {
                            _submitted = !_submitted;
                            _selectedRestaurant = widget.restaurant;
                          });
                          final OrderEntity order = OrderEntity(
                              mealDes: _selectedMeal,
                              orderDate: DateTime.now(),
                              userDepartment: currentUser!.photoURL!,
                              userEmail: currentUser!.email!);

                          await sl<AddDeleteOrderBloc>()
                              .addOrderUsecase(order, widget.restaurant);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        child: AutoSizeText(
                          'Submit',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  Widget CustomDailyMealsKSC(meals) {
    return ListView.builder(
      itemCount: meals.values.length == 1 ? 1 : meals['meals'].values.length,
      itemBuilder: (context, index) {
        if (meals.values.length == 1) {
          String message = 'no available data';
          return Center(child: Text(message));
        }
        if (meals['meals'].values.length == 1) {
          String mealName = meals['meals'].values.toList()[0];
          _selectedMeal = mealName;
          return customRadioListTile(0, mealName);
        }
        String mealName = meals['meals'].values.toList()[index];
        return customRadioListTile(index, mealName);
      },
    );
  }

  Widget customRadioListTile(index, mealName) {
    return RadioListTile(
      dense: true,
      activeColor: Theme.of(context).colorScheme.primary,
      controlAffinity: ListTileControlAffinity.leading,
      title: AutoSizeText(mealName,
          style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
      value: index,
      groupValue: _selectedIndex,
      onChanged: (value) {
        setState(() {
          _selectedIndex = value!;
          _selectedMeal = mealName;
        });
      },
    );
  }
}
