import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
class MoreWidget extends StatelessWidget {
  const MoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Divider(color:   Theme.of(context).colorScheme.onPrimary),
        GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              AutoSizeText('About Us', style: TextStyle(fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onTertiary)),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color:  Theme.of(context).colorScheme.onTertiary,
                size: 15,
              )
            ],
          ),
          onTap: () {
            
            context.router.pushNamed('aboutUs');
          },
        ),
         Divider(color:   Theme.of(context).colorScheme.onPrimary),
        GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              AutoSizeText('Ordering Policy',
                  style: TextStyle(fontWeight: FontWeight.bold,color:  Theme.of(context).colorScheme.onTertiary)),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Theme.of(context).colorScheme.onTertiary,
                size: 15,
              )
            ],
          ),
          onTap: () {
            context.router.pushNamed('orderingPolicy');
          },
        ),
         Divider(color:   Theme.of(context).colorScheme.onTertiary),
      ],
    );
  }
}
