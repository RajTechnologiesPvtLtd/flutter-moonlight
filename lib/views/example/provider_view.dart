import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';

class ProviderView extends StatelessWidget {
  const ProviderView({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: const CountView(),
    );
  }
}

class CountProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increaseCount() {
    _count++;
    notifyListeners();
  }
}

class CountView extends StatefulWidget {
  const CountView({super.key});

  @override
  State<CountView> createState() => _CountViewState();
}

class _CountViewState extends State<CountView> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    debugPrint("build");
    return Scaffold(
      appBar: const Navbar(title: "Provider View"),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child) {
          return Text(
            value.count.toString(),
            style: const TextStyle(fontSize: 50),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.increaseCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
