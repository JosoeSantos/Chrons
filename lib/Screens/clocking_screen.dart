import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:unit_converter/Widgets/day_clocking_list.dart';
import 'package:unit_converter/Widgets/digital_clock.dart';

class ClockingScreen extends StatefulWidget {
  const ClockingScreen();

  @override
  _ClockingScreen createState() => _ClockingScreen();
}

class _ClockingScreen extends State<ClockingScreen> {
  DateTime time;
  Timer _timer;
  final dayClockings = <DateTime>[];

  @override
  void initState() {
    super.initState();
    const timeout = const Duration(seconds: 1);
    _timer = new Timer.periodic(timeout, (Timer t) => updateClock());
    dayClockings.add(DateTime.now());
    print(dayClockings);
  }

  updateClock() {
    setState(() {
      time = DateTime.now();
    });
  }

  addClockingTime() {
    final now = DateTime.now();
    setState(() {
      dayClockings.add(now);
    });
  }

  @override
  void didUpdateWidget(ClockingScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final topBar = AppBar(
      elevation: 0,
      title: Text('Chronos'),
    );

    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: topBar,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 8),
                child: DigitalClock(
                  time: time,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: dayClockings.length > 0? DayClockingList(dayClockings) : null,
              ),
              OutlineButton(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                    'ADICIONAR PONTO',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                onPressed: () {
                  addClockingTime();
                },
              )
            ],
          ),
        ));
  }
}
