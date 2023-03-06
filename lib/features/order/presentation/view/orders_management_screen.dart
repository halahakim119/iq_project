// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../profile/data/datasource/user_data_source.dart';
import '../../../schedule/presentation/logic/get_all_meals_bloc/cubit/get_all_meals_cubit.dart';
import '../../../schedule/presentation/view/daily/widgets/weekend_widget.dart';
import 'detail.dart';

class OrdersManagementScreen extends StatefulWidget {
  const OrdersManagementScreen({super.key});

  @override
  State<OrdersManagementScreen> createState() => _OrdersManagementScreenState();
}

class _OrdersManagementScreenState extends State<OrdersManagementScreen> {
  int _day = DateTime.now().weekday;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      setState(() {
        _day = DateTime.now().weekday;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (_day == 5 || _day == 6)
        ? WeekendWidget()
        : BlocBuilder<GetAllMealsCubit, GetAllMealsState>(
            builder: (context, state) {
            return state.when(
                getAllMealsInitial: () =>
                    const Center(child: CircularProgressIndicator()),
                loadingGetAllMealsState: () =>
                    const Center(child: CircularProgressIndicator()),
                errorGetAllMealsState: (message) => Center(
                      child: Text('Error loading meals $message'),
                    ),
                loadedGetAllMealsState: (meals) => OrdersWidget(
                    kscSchedule: meals['ksc'],
                    awbaraSchedule: meals['awbara']));
          });
  }
}

class OrdersWidget extends StatefulWidget {
  final kscSchedule;
  final awbaraSchedule;

  OrdersWidget({required this.kscSchedule, required this.awbaraSchedule});

  @override
  State<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  String userType = '';
  Map<String, int> mealCount = {};

  @override
  void initState() {
    super.initState();
    UserDataSource.getUserType().then((value) {
      setState(() {
        value.fold((l) => null, (type) => userType = type);
      });
    });
  }

  int selectedDay = DateTime.now().weekday;

  @override
  Widget build(BuildContext context) {
    print(widget.awbaraSchedule);
    return userType == 'hq'
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10),
                child: Text(
                  "ksc",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w800),
                ),
              ),
              getData(widget.kscSchedule[selectedDay], "ksc"),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "Awbara",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w800),
                ),
              ),
              getData(widget.awbaraSchedule[selectedDay], "awbara")
            ],
          )
        : Column(
            children: [
              Text(
                userType,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w800,
                    fontSize: 24),
              ),
              userType == 'awbara'
                  ? getData(widget.awbaraSchedule[selectedDay], userType)
                  : getData(widget.kscSchedule[selectedDay], userType),
            ],
          );
  }

  Widget getData(data, resturant) {
    return Expanded(
        flex: 3,
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            height: 1,
            thickness: 0.3,
          ),
          itemCount: data.values.length == 1 ? 1 : data['meals'].values.length,
          itemBuilder: (BuildContext context, int index) {
            if (data.values.length == 1) {
              String message = 'no available data';
              return Center(child: Text(message));
            }
            String mealId = data['meals'].keys.toList()[index];
            String mealName = data['meals'].values.toList()[index];

            return detail(
              index: index,
              mealName: mealName,
              restaurant: resturant,
              uType: userType,
            );
          },
        ));
  }
}
