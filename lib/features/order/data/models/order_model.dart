import 'package:iq_project/features/order/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  final String? id;
  const OrderModel(
      {this.id,
      required String restaurantID,
      required String mealID,
      required String department})
      : super(
            restaurantID: restaurantID, mealID: mealID, department: department);

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'restaurant_id': restaurantID,
      'meal_id': mealID,
      'department': department
    };
  }

  factory OrderModel.fromJson(Map<String, Object?> json) {
    return OrderModel(
        id: json['id'] as String,
        restaurantID: json['restaurant_id'] as String,
        mealID: json['meal_id'] as String,
        department: json['department'] as String);
  }
}
