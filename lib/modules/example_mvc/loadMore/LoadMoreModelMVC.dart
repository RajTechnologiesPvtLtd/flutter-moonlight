import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import '../../../config/config.dart';

class LoadMoreModelMVC {
  int _page = 0;
  final int _limit = 20;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  List _records = [];
  final _baseUrl = ApiEndpoint.loadMoreUrl;

  late ScrollController _controller;
  // Getters
  List get records => _records;
  bool get hasNextPage => _hasNextPage;

  Future<void> firstLoad() async {
    _isFirstLoadRunning = true;
    try {
      final res =
          await http.get(Uri.parse("$_baseUrl?_page=$_page&_limit=$_limit"));
      _records = json.decode(res.body);
    } catch (err) {
      print('Something went wrong');
    }
    _isFirstLoadRunning = false;
  }

  Future<void> loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      _isLoadMoreRunning = true;
      _page += 1;
      try {
        final res =
            await http.get(Uri.parse("$_baseUrl?_page=$_page&_limit=$_limit"));
        final List fetchedRecords = json.decode(res.body);
        if (fetchedRecords.isNotEmpty) {
          _records.addAll(fetchedRecords);
        } else {
          _hasNextPage = false;
        }
      } catch (err) {
        print('Something went wrong!');
      }

      _isLoadMoreRunning = false;
    }
  }

  void initController() {
    _controller = ScrollController();
  }

  void disposeController() {
    _controller.dispose();
  }

  ScrollController getController() {
    return _controller;
  }

  // List getRecords() {
  //   return _records;
  // }

  // bool getIsFirstLoadRunning() {
  //   return _isFirstLoadRunning;
  // }

  // bool getIsLoadMoreRunning() {
  //   return _isLoadMoreRunning;
  // }

  // bool getHasNextPage() {
  //   return _hasNextPage;
  // }

  Future<void> refresh() async {
    _page = 0;
    _hasNextPage = true;
    _records = [];
    await firstLoad();
  }
}
