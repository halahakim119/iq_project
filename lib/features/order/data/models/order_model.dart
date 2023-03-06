import 'package:iq_project/features/order/domain/entities/order_entity.dart';
import 'package:intl/intl.dart';
class OrderModel extends OrderEntity {
  const OrderModel(
      {required DateTime orderDate,
      required String mealDes,
      required String userEmail,
      required String userDepartment})
      : super(
            orderDate: orderDate,
            mealDes: mealDes,
            userEmail: userEmail,
            userDepartment: userDepartment);

  Map<String, Object?> toJson() {
    return {
      'order_date':    DateFormat('yyyy-MM-dd').format(orderDate),
      'meal_des': mealDes,
      'user_email': userEmail,
      'user_department': userDepartment
    };
  }

  factory OrderModel.fromJson(Map<String, Object?> json) {
    return OrderModel(
        orderDate: json['order_date'] as DateTime,
        mealDes: json['meal_des'] as String,
        userEmail: json['user_email'] as String,
        userDepartment: json['user_department'] as String);
  }
}
