import '../models/LoadMoreModelMVC.dart';

class LoadMoreControllerMVC {
  final LoadMoreModelMVC model = LoadMoreModelMVC();

  Future<void> fetchFirstPosts() async {
    await model.firstLoad();
  }

  Future<void> fetchMorePosts() async {
    await model.loadMore();
  }
}
