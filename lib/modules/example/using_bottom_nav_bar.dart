import 'package:flutter/material.dart';

class UsingBottomNavBarView extends StatefulWidget {
  const UsingBottomNavBarView({super.key});

  @override
  State<UsingBottomNavBarView> createState() => _UsingBottomNavBarViewState();
}

class _UsingBottomNavBarViewState extends State<UsingBottomNavBarView>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Using Bottom Navigation Bar"),
      ),
      body: TabBarView(
        controller: controller,
        children: const <Widget>[FirstTab(), SecondTab(), ThirdTab()],
      ),
      bottomNavigationBar: Material(
        child: TabBar(
          tabs: const <Tab>[
            Tab(icon: Icon(Icons.favorite)),
            Tab(icon: Icon(Icons.adb)),
            Tab(icon: Icon(Icons.airport_shuttle)),
          ],
          controller: controller,
        ),
      ),
    );
  }
}

// Start of the Tab Bar View
class FirstTab extends StatelessWidget {
  const FirstTab({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          // center the children
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.favorite,
              size: 160.0,
              color: Colors.white,
            ),
            Text(
              "First Tab",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class SecondTab extends StatelessWidget {
  const SecondTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.adb,
              size: 160.0,
              color: Colors.white,
            ),
            Text(
              "Second Tab",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class ThirdTab extends StatelessWidget {
  const ThirdTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.airport_shuttle,
              size: 160.0,
              color: Colors.white,
            ),
            Text(
              "Third Tab",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
