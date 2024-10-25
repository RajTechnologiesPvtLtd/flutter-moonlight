import 'LoadMoreModelMVC.dart';

class LoadMoreControllerMVC {
  final LoadMoreModelMVC model = LoadMoreModelMVC();

  Future<void> fetchFirstRecords() async {
    await model.firstLoad();
  }

  Future<void> fetchMoreRecords() async {
    await model.loadMore();
  }
}
