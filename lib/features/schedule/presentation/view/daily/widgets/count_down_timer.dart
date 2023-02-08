import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  Timer _timer = Timer.periodic(Duration.zero, (timer) => {});
  int _start = 0;

  @override
  void initState() {
    super.initState();
    _start = 3600 -
        DateTime.now()
            .difference(DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, 12))
            .inSeconds;
    _startTimer();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    if (_start >= 0) {
      _timer = Timer.periodic(
        oneSec,
        (Timer timer) => setState(
          () {
            if (_start < 1) {
              timer.cancel();
            } else {
              _start = _start - 1;
            }
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final minute = (_start / 60).floor();
    final second = _start - minute * 60;
    return AutoSizeText(
      '${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}',
      style:  TextStyle(color: Theme.of(context).colorScheme.onTertiary,fontWeight: FontWeight.bold,fontSize: 16),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
