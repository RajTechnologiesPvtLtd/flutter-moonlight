import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config/config.dart';

import '../widgets/widgets.dart';

class LoadMoreView extends StatefulWidget {
  const LoadMoreView({super.key});

  @override
  State<LoadMoreView> createState() => _LoadMoreViewState();
}

class _LoadMoreViewState extends State<LoadMoreView> {
  // We will fetch data from this Rest api
  final _baseUrl = ApiEndpoint.loadMoreUrl;

  // At the beginning, we fetch the first 20 records
  int _page = 0;
  final int _limit = 20;

  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;

  // This holds the records fetched from the server
  List _records = [];

  // This function will be called when the app launches (see the initState function)
  _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      final res =
          await http.get(Uri.parse("$_baseUrl?_page=$_page&_limit=$_limit"));
      setState(() {
        _records = json.decode(res.body);
      });
    } catch (err) {
      print('Something went wrong');
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  // This function will be triggered whenver the user scroll
  // to near the bottom of the list view
  _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1; // Increase _page by 1
      try {
        final res =
            await http.get(Uri.parse("$_baseUrl?_page=$_page&_limit=$_limit"));

        final List fetchedRecords = json.decode(res.body);
        if (fetchedRecords.isNotEmpty) {
          setState(() {
            _records.addAll(fetchedRecords);
          });
        } else {
          // This means there is no more data
          // and therefore, we will not send another GET request
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        print('Something went wrong!');
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  // The controller for the ListView
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: "Load More"),
      body: _isFirstLoadRunning
          ? fullScreenLoader()
          : (_records.isEmpty)
              ? noDataFound()
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: _controller,
                        itemCount: _records.length,
                        itemBuilder: (_, index) => Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: ListTile(
                            title: Text(_records[index]['title']),
                            // subtitle: Text(_records[index]['body']),
                          ),
                        ),
                      ),
                    ),

                    // when the _loadMore function is running
                    if (_isLoadMoreRunning == true) onScreenLoader(),

                    // When nothing else to load
                    if (_hasNextPage == false) noMoreContent()
                  ],
                ),
    );
  }
}
