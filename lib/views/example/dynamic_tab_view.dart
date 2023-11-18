import 'dart:convert';

import 'package:flutter/material.dart';

class DynamicTabView extends StatefulWidget {
  const DynamicTabView({super.key});

  @override
  State<DynamicTabView> createState() => _DynamicTabViewState();
}

class _DynamicTabViewState extends State<DynamicTabView> {
   late List<Tab> _tabs = [];
  late List<Widget> _tabViews = [];

  @override
  void initState() {
    super.initState();
    _loadTabsAndData();
  }

  void _loadTabsAndData() async {
    // Load data from the local JSON file
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/json/tabs.json');
    List<dynamic> data = json.decode(jsonString);
  
    // Process data to create tabs and corresponding views
    List<Tab> tabs = [];
    List<Widget> tabViews = [];

    for (var entry in data) {
      String tabTitle = entry['tabTitle'];
      List<String> items = List<String>.from(entry['items']);

      tabs.add(Tab(text: tabTitle));
      tabViews.add(_buildTabView(items));
    }

    // Update the state with the generated tabs and views
    setState(() {
      _tabs = tabs;
      _tabViews = tabViews;
    });
  }

  Widget _buildTabView(List<String> items) {
    // Create a simple ListView for each tab view
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic Tab View'),
          bottom: TabBar(
            tabs: _tabs,
          ),
        ),
        body: TabBarView(
          children: _tabViews,
        ),
      ),
    );
  }
}