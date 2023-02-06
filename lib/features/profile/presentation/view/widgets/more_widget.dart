import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MoreWidget extends StatelessWidget {
  const MoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('About Us', style: TextStyle(fontWeight: FontWeight.bold)),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
                size: 15,
              )
            ],
          ),
          onTap: () {
            context.router.pushNamed('auth');
          },
        ),
        const Divider(),
        GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Ordering Policy',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
                size: 15,
              )
            ],
          ),
          onTap: () {
            context.router.pushNamed('auth');
          },
        ),
        const Divider(),
      ],
    );
  }
}
