import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../widgets/widgets.dart';

class CacheView extends StatefulWidget {
  const CacheView({super.key});

  @override
  State<CacheView> createState() => _CacheViewState();
}

class _CacheViewState extends State<CacheView> {
  final List<Map<String, String>> benchmarkResults = [];

  void addBenchmarkResult(String description, int time) {
    setState(() {
      benchmarkResults.add({'description': description, 'time': '$time ms'});
    });
  }

  void benchmark(Future<void> Function() action, String description) async {
    final stopwatch = Stopwatch()..start();
    await action();
    stopwatch.stop();
    addBenchmarkResult(description, stopwatch.elapsedMilliseconds);
  }

  Future<void> sharedPrefBenchmarks() async {
    final random = Random();
    final Map<String, String> testData = {};
    for (int i = 0; i < 1000; i++) {
      testData['key$i'] = 'value${random.nextInt(10000)}';
    }

    benchmark(() async {
      final prefs = await SharedPreferences.getInstance();
      for (var entry in testData.entries) {
        prefs.setString(entry.key, entry.value);
      }
    }, 'Shared Preferences Write Time');

    benchmark(() async {
      final prefs = await SharedPreferences.getInstance();
      for (var key in testData.keys) {
        prefs.getString(key);
      }
    }, 'Shared Preferences Read Time');
  }

  Future<void> getStorageBenchmarks() async {
    await GetStorage.init();
    final random = Random();
    final storage = GetStorage();

    final Map<String, String> testData = {};
    for (int i = 0; i < 1000; i++) {
      testData['key$i'] = 'value${random.nextInt(10000)}';
    }

    benchmark(() async {
      for (var entry in testData.entries) {
        storage.write(entry.key, entry.value);
      }
    }, 'Get Storage Write Time');

    benchmark(() async {
      for (var key in testData.keys) {
        storage.read(key);
      }
    }, 'Get Storage Read Time');
  }

  Future<void> hiveBenchmarks() async {
    await Hive.initFlutter();
    final random = Random();
    const boxName = 'benchmarkBox';
    final box = await Hive.openBox<String>(boxName);

    final Map<String, String> testData = {};
    for (int i = 0; i < 1000; i++) {
      testData['key$i'] = 'value${random.nextInt(10000)}';
    }

    benchmark(() async {
      for (var entry in testData.entries) {
        box.put(entry.key, entry.value);
      }
    }, 'Hive Write Time');

    benchmark(() async {
      for (var key in testData.keys) {
        box.get(key);
      }
    }, 'Hive Read Time');
  }

  Future<void> secureStorageBenchmarks() async {
    final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    final random = Random();
    const boxName = 'secureStorageBox';

    // Generate test data with boxName prefix
    final Map<String, String> testData = {};
    for (int i = 0; i < 1000; i++) {
      testData['$boxName-key$i'] = 'value${random.nextInt(10000)}';
    }

    // Secure Storage Write Benchmark
    benchmark(() async {
      for (var entry in testData.entries) {
        await secureStorage.write(key: entry.key, value: entry.value);
      }
    }, 'Secure Storage Write Time');

    // Secure Storage Read Benchmark
    benchmark(() async {
      for (var key in testData.keys) {
        await secureStorage.read(key: key);
      }
    }, 'Secure Storage Read Time');
  }

  @override
  void initState() {
    super.initState();
    sharedPrefBenchmarks();
    getStorageBenchmarks();
    hiveBenchmarks();
    secureStorageBenchmarks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: "Cache Examples"),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: benchmarkResults.length,
        itemBuilder: (context, index) {
          final result = benchmarkResults[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(
                result['description']!.contains('Write')
                    ? Icons.edit
                    : Icons.read_more,
                color: result['description']!.contains('Write')
                    ? Colors.blue
                    : Colors.green,
              ),
              title: Text(
                result['description']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Execution Time: ${result['time']}'),
            ),
          );
        },
      ),
    );
  }
}
