import 'package:flutter/material.dart';

class MoreWidget extends StatelessWidget {
  const MoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [const Divider(),
          GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('About Us',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                  size: 15,
                )
              ],
            ),
            onTap: () {
              // handle button press
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
              // handle button press
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
