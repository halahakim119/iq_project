import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class OrderingPolicyScreen extends StatelessWidget {
  const OrderingPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () => context.router.pop(),
              icon: const Icon(
                Icons.chevron_left_rounded,
                color: Colors.white,
                size: 30,
              )),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Text(
            'About us',
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.01, 1]),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      textAlign: TextAlign.justify,
                      'Welcome to the HQ food ordering app, where hunger and cravings meet their match! This app is developed by thr Mobile Application Development team of iQ who know the importance of a good meal during a long work day. Remember, this app is exclusively for our beloved employees, so let\'s make the most of it.',
                      maxLines: 10,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/iq_logo.webp'),
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
