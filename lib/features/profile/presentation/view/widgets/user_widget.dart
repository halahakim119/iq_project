import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final String? name;
  final String? password;
  final String? email;
  final String? department;
  const UserWidget({this.name, this.password, this.department, this.email});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        ' welcome $name ',
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: $name'),
              Text('password: $password'),
              Text('email: $email'),
              Text('department: $department'),
            ],
          ),
        )
      ],
    );
  }
}
