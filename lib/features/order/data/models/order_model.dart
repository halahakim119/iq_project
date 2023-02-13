import 'package:iq_project/features/order/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({String? restaurantID, String? mealID})
      : super(restaurantID: restaurantID, mealID: mealID);

  Map<String, Object?> toJson() {
    return {
      'restaurant_id': restaurantID,
      'meal_id': mealID,
    };
  }

  factory OrderModel.fromJson(Map<String, Object?> json) {
    return OrderModel(
        restaurantID: json['restaurant_id'] == null
            ? null
            : json['restaurant_id'] as String,
        mealID: json['meal_id'] == null ? null : json['meal_id'] as String);
  }
}
