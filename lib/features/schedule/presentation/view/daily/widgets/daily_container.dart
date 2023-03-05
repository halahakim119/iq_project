import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_project/features/order/domain/entities/order_entity.dart';
import 'package:iq_project/features/order/presentation/logic/bloc/add_delete_order_bloc.dart';

import '../../../../../../../core/injection/injection_container.dart' as di;
import '../../../../../../core/injection/injection_container.dart';

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
  String _selectedMeal = '';
  bool _submitted = false;
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AddDeleteOrderBloc>(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: Theme.of(context).colorScheme.primary),
          color: Theme.of(context).colorScheme.secondary,
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
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, bottom: 30),
                    child: AutoSizeText(
                      _selectedMeal,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            String mealId = widget
                                .schedule[widget.selectedDay]['meals'].keys
                                .toList()[_selectedIndex];
                                print(mealId);
                            await sl<AddDeleteOrderBloc>().deleteOrderUsecase(
                                mealId, DateTime.now(), widget.restaurant);

                            setState(() {
                              _submitted = false;
                              // _selectedMeal = '';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.35, 50),
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                          child: AutoSizeText(
                            'Delete',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        ),
                      ],
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
                      flex: 5,
                      child: CustomDailyMealsKSC(
                          widget.schedule[widget.selectedDay])),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _submitted = !_submitted;
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
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.7, 50),
                        backgroundColor: Theme.of(context).colorScheme.primary,
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
