import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String restaurantID;
  final String mealID;
  final String department;
  const OrderEntity({
    required this.restaurantID,
    required this.mealID,
    required this.department,
  });

  @override
  List<Object?> get props => [restaurantID, mealID, department];
}
