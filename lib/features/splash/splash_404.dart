// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/theme/custom_elevated_button.dart';

class Splash404 extends StatelessWidget {
  String error;
  Splash404({required this.error});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.7,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/404.png'),
                    fit: BoxFit.contain),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          const Text(
            'Oops!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(error),
          const SizedBox(
            height: 100,
          ),
          CustomElevatedButton(
            child: const Text('Back To Home Page'),
            onPressed: () {
              context.router.pushNamed('main');
            },
          )
        ]),
      ),
    );
  }
}
