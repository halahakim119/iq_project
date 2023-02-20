import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  String? restaurantID;
  String? mealID;
  String? department;
  OrderEntity({
    required this.restaurantID,
    required this.mealID,
    required this.department,
  });

  @override
  List<Object?> get props => [restaurantID, mealID, department];
}
