import 'package:equatable/equatable.dart';

class Order extends Equatable {
  String restaurantID;
  String mealID;
  Order({
    required this.restaurantID,
    required this.mealID,
  });

  @override
  List<Object?> get props => [restaurantID, mealID];
}
