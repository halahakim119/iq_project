import 'package:flutter/material.dart';

import 'core/theme/app_layout.dart';
import 'features/auth/auth_screen.dart';

class WhatDoWeHave extends StatelessWidget {
  int? pageNum;
  WhatDoWeHave({
    this.pageNum,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const token = true;
    return token == true
        ? AppLayout(
            pageNum: pageNum ?? 1,
          )
        : const AuthScreen();
  }
}
