import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final DateTime orderDate;
  final String mealDes;
  final String userEmail;
  final String userDepartment;
  const OrderEntity({
    required this.orderDate,
    required this.mealDes,
    required this.userEmail,
    required this.userDepartment,
  });

  @override
  List<Object?> get props => [orderDate, mealDes, userEmail, userDepartment];
}
