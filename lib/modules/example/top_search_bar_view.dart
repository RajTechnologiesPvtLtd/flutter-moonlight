import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class TopSearchBarView extends StatelessWidget {
  const TopSearchBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Search Bar"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const Center(
        child: Text("Top Search Bar View"),
      ),
    );
  }
}
