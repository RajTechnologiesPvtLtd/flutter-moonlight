import 'package:flutter/material.dart';

class UsingBottomNavBarView extends StatefulWidget {
  UsingBottomNavBarView({Key? key}) : super(key: key);

  @override
  State<UsingBottomNavBarView> createState() => _UsingBottomNavBarViewState();
}

class _UsingBottomNavBarViewState extends State<UsingBottomNavBarView>
    with SingleTickerProviderStateMixin {
  // Create a tab controller
  late TabController controller;

  @override
  void initState() {
    super.initState();
    // Initialize the Tab Controller
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Title
          title: Text("Using Bottom Navigation Bar"),
          // Set the background color of the App Bar
          backgroundColor: Colors.blue,
        ),
        body: TabBarView(
          // Add tabs as widgets
          children: <Widget>[FirstTab(), SecondTab(), ThirdTab()],
          // set the controller
          controller: controller,
        ),
        bottomNavigationBar: Material(
            // set the color of the bottom navigation bar
            color: Colors.blue,
            // set the tab bar as the child of bottom navigation bar
            child: TabBar(
              tabs: <Tab>[
                Tab(
                  // set icon to the tab
                  icon: Icon(Icons.favorite),
                ),
                Tab(
                  icon: Icon(Icons.adb),
                ),
                Tab(
                  icon: Icon(Icons.airport_shuttle),
                ),
              ],
              // setup the controller
              controller: controller,
            )));
  }
}

// Start of the Tab Bar View
class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        child: Center(
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
      ),
    );
  }
}

class SecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        child: Center(
          child: Column(
            // center the children
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
      ),
    );
  }
}

class ThirdTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        child: Center(
          child: Column(
            // center the children
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
      ),
    );
  }
}
