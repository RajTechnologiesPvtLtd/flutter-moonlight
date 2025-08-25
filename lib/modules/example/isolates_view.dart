import 'dart:isolate';
import 'package:flutter/foundation.dart'; // Required for compute()
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart'; // Assuming Navbar is custom

/// ------------------------------
///   HEAVY TASK FUNCTIONS
/// ------------------------------

/// Heavy computation (used in both main thread and isolate)
double _heavyComputation(int iterations) {
  double total = 0.0;
  for (var i = 0; i < iterations; i++) {
    total += i;
  }
  return total;
}

/// Used for running on main thread
Future<double> complexTaskOnMainThread() async {
  return _heavyComputation(1000000000);
}

/// Used with Isolate.spawn
void complexTaskInIsolate(SendPort sendPort) {
  double total = _heavyComputation(1000000000);
  sendPort.send(total);
}

/// Used with compute()
double complexTaskWithCompute(int iterations) {
  return _heavyComputation(iterations);
}

/// ------------------------------
///   MAIN UI WIDGET
/// ------------------------------

class IsolatesView extends StatefulWidget {
  const IsolatesView({super.key});

  @override
  State<IsolatesView> createState() => _IsolatesViewState();
}

class _IsolatesViewState extends State<IsolatesView> {
  double result = 0;
  bool isLoading = false;

  void _setLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  /// Blocking task
  Future<void> runBlockingTask() async {
    _setLoading(true);
    double value = await complexTaskOnMainThread();
    setState(() {
      result = value;
      isLoading = false;
    });
    debugPrint("Main thread result: $value");
  }

  /// Isolate.spawn task
  Future<void> runNonBlockingTask() async {
    _setLoading(true);
    final receivePort = ReceivePort();

    await Isolate.spawn(complexTaskInIsolate, receivePort.sendPort);

    receivePort.listen((value) {
      setState(() {
        result = value;
        isLoading = false;
      });
      debugPrint("Isolate result: $value");
      receivePort.close();
    });
  }

  /// compute() task
  Future<void> runComputeTask() async {
    _setLoading(true);
    final value = await compute(complexTaskWithCompute, 1000000000);
    setState(() {
      result = value;
      isLoading = false;
    });
    debugPrint("Compute result: $value");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: "Isolate, Compute, and Future Processing Demo"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading) const CircularProgressIndicator(),
              if (!isLoading)
                Text("Result: $result", style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: runBlockingTask,
                child: const Text("Run on Main Thread (Blocking UI)"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: runNonBlockingTask,
                child: const Text("Run in Isolate.spawn (Non-Blocking)"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: runComputeTask,
                child: const Text("Run with compute() (Simplified Isolate)"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
