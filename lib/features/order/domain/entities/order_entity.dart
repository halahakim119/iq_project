import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  String? restaurantID;
  String? mealID;
  OrderEntity({
    required this.restaurantID,
    required this.mealID,
  });

  @override
  List<Object?> get props => [restaurantID, mealID];
}
