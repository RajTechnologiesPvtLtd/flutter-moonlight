import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repositories/item_repository.dart';
import 'item_model.dart';

class HomeController extends GetxController {
  final ItemRepository _repo = ItemRepository();
  ScrollController scrollController = ScrollController();
  int get perPage => _repo.perPage;

  RxList<Item> records = <Item>[].obs;
  var isLoading = false.obs;
  var currentPage = 0.obs;
  var totalItems = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    isLoading(true);
    await loadRecords();
    isLoading(false);
  }

  Future<void> loadRecords() async {
    List measurements = await _repo.getPaginate();
    records.addAll(measurements.map((e) => ItemModel.fromJson(e)));
  }

  Future<void> save(ItemModel record) async {
    await _repo.store(record.toJson());
    loadInitialData();
  }

  Future<void> delete(int id) async {
    await _repo.delete(id);
    loadInitialData();
  }
}
