import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

import '../../../../../../core/injection/injection_container.dart';
import '../../../../profile/data/models/user_model.dart';
import '../../logic/add_delete_meal_bloc/add_delete_meal_bloc.dart';
import '../../logic/get_all_meals_bloc/cubit/get_all_meals_cubit.dart';
import '../weekly/widgets/day_button.dart';

class ScheduleManagementScreen extends StatefulWidget {
  const ScheduleManagementScreen({Key? key}) : super(key: key);

  @override
  _ScheduleManagementScreenState createState() =>
      _ScheduleManagementScreenState();
}

class _ScheduleManagementScreenState extends State<ScheduleManagementScreen> {
  int selectedDay = 0;
  String userType = '';
  final TextEditingController _textController = TextEditingController();

  void onPressed(int index) {
    setState(() {
      selectedDay = index;
    });
  }

  @override
  void dispose() {
    _textController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getUserType().then((value) {
      setState(() {
        userType = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DayButton(
              day: 'Sun',
              index: 0,
              selectedDay: selectedDay,
              onPressed: onPressed,
            ),
            DayButton(
              day: 'Mon',
              index: 1,
              selectedDay: selectedDay,
              onPressed: onPressed,
            ),
            DayButton(
              day: 'Tue',
              index: 2,
              selectedDay: selectedDay,
              onPressed: onPressed,
            ),
            DayButton(
              day: 'Wed',
              index: 3,
              selectedDay: selectedDay,
              onPressed: onPressed,
            ),
            DayButton(
              day: 'Thu',
              index: 4,
              selectedDay: selectedDay,
              onPressed: onPressed,
            ),
          ],
        ),
        Expanded(
          child: BlocBuilder<GetAllMealsCubit, GetAllMealsState>(
            builder: (context, state) {
              return state.when(
                getAllMealsInitial: () => const CircularProgressIndicator(),
                loadingGetAllMealsState: () =>
                    const CircularProgressIndicator(),
                loadedGetAllMealsState: (meals) => ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                    thickness: 0.3,
                  ),
                  itemCount: meals[userType][selectedDay].values.length == 1
                      ? 1
                      : meals[userType][selectedDay]['meals'].values.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (meals[userType][selectedDay].values.length == 1) {
                      String message = 'no available data';
                      return Center(child: Text(message));
                    }
                    String mealId = meals[userType][selectedDay]['meals']
                        .keys
                        .toList()[index];
                    String mealName = meals[userType][selectedDay]['meals']
                        .values
                        .toList()[index];

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
                              .deleteMealUsecase(mealId, selectedDay);
                        },
                      ),
                      title: Text(
                        mealName,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    );
                  },
                ),
                errorGetAllMealsState: (message) => Center(
                  child: Text('Error loading meals $message'),
                ),
              );
            },
          ),
        ),
        Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.only(
              left: 20,
              top: 5,
              bottom: 15,
              right: 10,
            ),
            child: TextFormField(
              controller: _textController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a meal description';
                }
                return null;
              },
              decoration: InputDecoration(
                prefix: const SizedBox(
                  width: 10,
                ),
                hintText: 'Add a meal',
                hintStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                suffixIcon: IconButton(
                  iconSize: 30,
                  color: Theme.of(context).colorScheme.primary,
                  icon: const Icon(UniconsThinline.arrow_circle_right),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await sl<AddDeleteMealBloc>()
                          .addMealUsecase(_textController.text, selectedDay);
                      _textController.clear();
                    }
                  },
                ),
                fillColor: Colors.transparent,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

Future<String> getUserType() async {
  final currentUser = FirebaseAuth.instance.currentUser;
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('users/${currentUser!.uid}').get();

  if (snapshot.exists) {
    final dataString = json.encode(snapshot.value);

    Map<String, dynamic> data = json.decode(dataString);

    final userEntity = UserModel.fromFirebaseMap(data);
    if (userEntity.uType.isNotEmpty) {
      if (userEntity.uType == 'KSCKitchen') {
        return 'ksc';
      } else if (userEntity.uType == 'AwbaraKitchen') {
        return 'awbara';
      }
    }
  }
  return '';
}
