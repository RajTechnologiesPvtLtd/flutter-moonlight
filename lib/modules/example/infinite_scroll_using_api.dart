import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InfiniteScrollUsingAPIView extends StatefulWidget {
  const InfiniteScrollUsingAPIView({super.key});

  @override
  State<InfiniteScrollUsingAPIView> createState() =>
      _InfiniteScrollUsingAPIViewState();
}

class _InfiniteScrollUsingAPIViewState
    extends State<InfiniteScrollUsingAPIView> {
  final _scrollController = ScrollController();
  final _records = <dynamic>[];
  int _currentPage = 1;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMore);
    _fetchData(_currentPage);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchData(int pageKey) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts?page=$pageKey'));
    try {
      if (response.statusCode == 200) {
        var records =
            List<Map<String, dynamic>>.from(json.decode(response.body));
        setState(() {
          _records.addAll(records);
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = e.toString();
      });
    }
  }

  void _loadMore() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _currentPage++;
      _fetchData(_currentPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite Scroll Using API'),
      ),
      body: _errorMessage != null
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text('Error: $_errorMessage')),
            )
          : ListView.builder(
              controller: _scrollController,
              itemCount: _records.length + (_isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _records.length) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return Card(
                    child: ListTile(
                      title: Text(_records[index]['title']),
                    ),
                  );
                }
              },
            ),
    );
  }
}
