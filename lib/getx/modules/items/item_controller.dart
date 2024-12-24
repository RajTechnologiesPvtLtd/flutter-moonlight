import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repositories/item_repository.dart';
import 'item_model.dart';

class ItemController extends GetxController {
  final ItemRepository _repo = ItemRepository();
  ScrollController scrollController = ScrollController();
  int get perPage => _repo.perPage;

  RxList<Item> records = <Item>[].obs;
  RxBool isLoading = false.obs;
  // RxInt currentPage = 0.obs;
  // RxInt totalItems = 0.obs;
  // Filter with search text
  Timer? _debounce;
  RxString search = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadInitialData();
  }

  @override
  void onClose() {
    // Dispose the debounce timer when the controller is closed
    _debounce?.cancel();
    super.onClose();
  }

  Future<void> loadInitialData() async {
    isLoading(true);
    await loadRecords();
    isLoading(false);
  }

  void onSearchChanged(String value) {
    // Cancel any previous timer
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 2000), () {
      search.value = value;
      loadRecords(search: value);
    });
  }

  Future<void> loadRecords({
    String? search,
  }) async {
    List newRecords = await _repo.getPaginate(
      queryParams: {
        'title': search,
      },
    );
    records.addAll(newRecords.map((e) => ItemModel.fromJson(e)));
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
