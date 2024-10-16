import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config/config.dart';

import '../core/classes/classes.dart';
import '../widgets/widgets.dart';

class LoadMoreWithCacheView extends StatefulWidget {
  const LoadMoreWithCacheView({super.key});

  @override
  State<LoadMoreWithCacheView> createState() => _LoadMoreWithCacheViewState();
}

class _LoadMoreWithCacheViewState extends State<LoadMoreWithCacheView> {
  // We will fetch data from this Rest api
  final _baseUrl = ApiEndpoint.loadMoreUrl;

  // At the beginning, we fetch the first 20 records
  final int _page = 0;
  final int _limit = 20;

  // There is next page or not
  final bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  final bool _isLoadMoreRunning = false;

  // This holds the records fetched from the server
  List _records = [];

  // This function will be called when the app launches (see the initState function)
  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });

    try {
      bool checkChapters = await CacheManager.checkKeyExist("api_chapters");
      if (!checkChapters) {
        final response =
            await http.get(Uri.parse("$_baseUrl?_page=$_page&_limit=$_limit"));
        if (response.statusCode == 200) {
          if (response.body.isNotEmpty) {
            var dataConvertedToJSON = response.body;
            CacheManager.saveData("api_chapters", dataConvertedToJSON);
            setState(() {
              _records = jsonDecode(dataConvertedToJSON);
            });
          }
        }
      } else {
        var dataJSON = await CacheManager.readData("api_chapters");
        setState(() {
          _records = jsonDecode(dataJSON);
        });
      }
    } catch (err) {
      print('Something went wrong');
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _firstLoad();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: "Load More With Cache"),
      body: _isFirstLoadRunning
          ? fullScreenLoader()
          : (_records.isEmpty)
              ? noDataFound()
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: _records.length,
                        itemBuilder: (_, index) => Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: ListTile(
                            title: Text(_records[index]['title']),
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
