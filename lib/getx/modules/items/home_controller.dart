import 'package:get/get.dart';

import 'item_model.dart';

class HomeController extends GetxController {
  RxList<Item> records = <Item>[].obs;
  var isLoading = false.obs;
  var currentPage = 0.obs;
  var totalItems = 0.obs;
}
