import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? department;
  const UserWidget(
      {this.firstName, this.lastName, this.department, this.email});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        ' welcome $firstName ',
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: $firstName $lastName '),
              Text('email: $email'),
              Text('department: $department'),
            ],
          ),
        )
      ],
    );
  }
}
