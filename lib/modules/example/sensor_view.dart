import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import '../../widgets/widgets.dart';

class SensorView extends StatefulWidget {
  const SensorView({super.key});

  @override
  State<SensorView> createState() => _SensorViewState();
}

class _SensorViewState extends State<SensorView> {
  // List to store accelerometer data
  List<AccelerometerEvent> _accelerometerValues = [];

  // StreamSubscription for accelerometer events
  late StreamSubscription<AccelerometerEvent> _accelerometerSubscription;
  // To track the previous angles for up/down and side tilts
  double? _previousUpDownAngle;
  double? _previousSideAngle;

  @override
  void initState() {
    super.initState();

    // Subscribe to accelerometer events
    _accelerometerSubscription = accelerometerEvents.listen((event) {
      setState(() {
        // Update the _accelerometerValues list with the latest event
        _accelerometerValues = [event];
        // Calculate the angle
        _processAccelerometerEvent(event);
      });
    });
  }

  @override
  void dispose() {
    // Cancel the accelerometer event subscription to prevent memory leaks
    _accelerometerSubscription.cancel();
    super.dispose();
  }

  // Process the accelerometer event to calculate angles and trigger events
  void _processAccelerometerEvent(AccelerometerEvent event) {
    // Calculate the up/down angle (z-axis) and side angle (y-axis)
    double upDownAngle =
        _calculateTiltAngle(event.x, event.y, event.z, axis: 'z');
    double sideAngle =
        _calculateTiltAngle(event.x, event.y, event.z, axis: 'y');

    // Trigger events if up/down angle changes by at least 25°
    if (_previousUpDownAngle != null) {
      double angleDifference = (upDownAngle - _previousUpDownAngle!).abs();
      if (angleDifference >= 25) {
        if (upDownAngle > _previousUpDownAngle!) {
          _triggerEvent('up'); // Moving up
        } else {
          _triggerEvent('down'); // Moving down
        }
      }
    }

    // Trigger events if side angle changes by at least 25°
    if (_previousSideAngle != null) {
      double angleDifference = (sideAngle - _previousSideAngle!).abs();
      if (angleDifference >= 25) {
        if (sideAngle > _previousSideAngle!) {
          _triggerEvent('right tilt'); // Tilting right
        } else {
          _triggerEvent('left tilt'); // Tilting left
        }
      }
    }

    // Update the previous angles
    _previousUpDownAngle = upDownAngle;
    _previousSideAngle = sideAngle;
  }

  // Calculate the tilt angle based on x, y, and z accelerometer values for a specific axis
  double _calculateTiltAngle(double x, double y, double z,
      {required String axis}) {
    final magnitude = sqrt(x * x + y * y + z * z);
    switch (axis) {
      case 'z': // Up/down angle based on z-axis
        return ((z / magnitude) * 180 / pi).abs();
      case 'y': // Side angle based on y-axis
        return ((y / magnitude) * 180 / pi).abs();
      default:
        return 0.0;
    }
  }

  // Trigger event method
  void _triggerEvent(String direction) {
    debugPrint('Event triggered: $direction');
    // Add your game logic or additional actions here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: "Sensors"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Accelerometer Data:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            if (_accelerometerValues.isNotEmpty)
              Text(
                'X: ${_accelerometerValues[0].x.toStringAsFixed(2)}, '
                'Y: ${_accelerometerValues[0].y.toStringAsFixed(2)}, '
                'Z: ${_accelerometerValues[0].z.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16),
              )
            else
              Text('No data available', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
