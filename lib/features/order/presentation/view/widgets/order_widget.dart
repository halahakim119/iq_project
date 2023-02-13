// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_project/features/order/domain/entities/order_entity.dart';

import '../../../../../core/injection/injection_container.dart' as di;
import '../../../../../core/theme/custom_loading.dart';
import '../../logic/cubit/order_cubit.dart';

class OrderWidget extends StatelessWidget {
  final OrderEntity parameters;
  OrderWidget({
    required this.parameters,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => di.sl<OrderCubit>()..order(parameters),
        child: BlocBuilder<OrderCubit, OrderState>(builder: (context, state) {
          return state.when(
              loading: () => const CustomLoading(),
              loaded: () => OrderDetailContainer(parameters: parameters),
              error: (error) => ShowErrorDialog(error: error));
        }));
  }
}

class OrderDetailContainer extends StatelessWidget {
  final OrderEntity parameters;
  OrderDetailContainer({
    required this.parameters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Order Detail"),
          Text("Restaurant ID: ${parameters.restaurantID}"),
          Text("Meal ID: ${parameters.mealID}"),
        ],
      ),
    );
  }
}

class ShowErrorDialog extends StatelessWidget {
  final String error;
  ShowErrorDialog({
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Text("Error"),
        content: Text("Error Occured: $error"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
