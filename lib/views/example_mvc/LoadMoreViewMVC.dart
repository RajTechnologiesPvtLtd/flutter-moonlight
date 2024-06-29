import 'package:flutter/material.dart';
import '../../controllers/controllers.dart';
import '../../widgets/widgets.dart';

class LoadMoreViewMVC extends StatefulWidget {
  const LoadMoreViewMVC({super.key});

  @override
  State<LoadMoreViewMVC> createState() => _LoadMoreViewMVCState();
}

class _LoadMoreViewMVCState extends State<LoadMoreViewMVC> {
  final LoadMoreControllerMVC controller = LoadMoreControllerMVC();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.fetchFirstRecords();
    _scrollController.addListener(_loadMore);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_loadMore);
    super.dispose();
  }

  void _loadMore() {
    final double scrollExtent = _scrollController.position.maxScrollExtent;
    final double currentPosition = _scrollController.position.pixels;
    final double delta = scrollExtent - currentPosition;
    if (delta < 200 && controller.model.hasNextPage) {
      controller.fetchMoreRecords();
    }
  }

  Widget _buildList() {
    if (controller.model.records.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        controller: _scrollController,
        itemCount: controller.model.records.length +
            (controller.model.hasNextPage ? 1 : 0),
        itemBuilder: (_, index) {
          if (index == controller.model.records.length) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final record = controller.model.records[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: ListTile(
                title: Text(record['title']),
              ),
            );
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MoonLightDrawer("Load More MVC"),
      appBar: const Navbar(title: "Load More MVC"),
      body: _buildList(),
    );
  }
}
