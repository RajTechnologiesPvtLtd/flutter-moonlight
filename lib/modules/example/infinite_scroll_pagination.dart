import 'package:flutter/material.dart';

class InfiniteScrollPaginationView extends StatefulWidget {
  const InfiniteScrollPaginationView({super.key});

  @override
  State<InfiniteScrollPaginationView> createState() =>
      _InfiniteScrollPaginationViewState();
}

class _InfiniteScrollPaginationViewState
    extends State<InfiniteScrollPaginationView> {
  final _scrollController = ScrollController();
  final _records = List.generate(20, (index) => 'Item ${index + 1}');
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMore);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMore() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        _currentPage++;
        _records.addAll(List.generate(
            20, (index) => 'Item ${index + 1 + _currentPage * 20}'));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite Scroll'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _records.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_records[index]),
          );
        },
      ),
    );
  }
}
