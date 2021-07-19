import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gibbly/components/bg_painter.dart';
import 'package:gibbly/components/measure_card.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<double> _accelerometerValue = [0, 0, 0];
  List<double> _userAccelerometerValue = [0, 0, 0];
  List<double> _gyroscopeValue = [0, 0, 0];
  final _streamSubscription = <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    super.initState();
    _streamSubscription.add(accelerometerEvents.listen((event) {
      setState(() {
        _accelerometerValue = <double>[event.x, event.y, event.z];
      });
    }));
    _streamSubscription.add(userAccelerometerEvents.listen((event) {
      setState(() {
        _userAccelerometerValue = <double>[event.x, event.y, event.z];
      });
    }));
    _streamSubscription.add(gyroscopeEvents.listen((event) {
      setState(() {
        _gyroscopeValue = <double>[event.x, event.y, event.z];
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    final accelerometer =
        _accelerometerValue.map((e) => e.toStringAsFixed(1)).toList();
    final userAccelerometer =
        _userAccelerometerValue.map((e) => e.toStringAsFixed(1)).toList();
    final gyroscope = _gyroscopeValue.map((e) => e.toStringAsFixed(1)).toList();
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MeasureCard(text: 'Accelerometer', values: accelerometer),
            MeasureCard(text: 'User Accelerometer', values: userAccelerometer),
            MeasureCard(text: 'Gyroscope', values: gyroscope),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscription) {
      subscription.cancel();
    }
  }
}
