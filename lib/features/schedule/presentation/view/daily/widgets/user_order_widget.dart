import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
class UserOrderWidget extends StatelessWidget {
  const UserOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AutoSizeText('order has been submited '),
    );
  }
}
