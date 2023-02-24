import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  image: const DecorationImage(
                      image: AssetImage('assets/images/iq_logo.webp'),
                      fit: BoxFit.contain),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
            ),
            const Text(
              'About us',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
           
            const SizedBox(height: 10),
            
            const Text(
              textAlign: TextAlign.justify,
              'Welcome to the HQ food ordering app, where hunger and cravings meet their match! This app is developed by thr Mobile Application Development team of iQ who know the importance of a good meal during a long work day. Remember, this app is exclusively for our beloved employees, so let\'s make the most of it.',
              maxLines: 10,
            ),
             IconButton(
                onPressed: () => context.router.pop(), icon: BackButton()),
          ]),
        ),
      ),
    );
  }
}
