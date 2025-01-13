import 'package:get/get.dart';

import '../../../core/classes/classes.dart';
import '../../app.dart';
import 'onboarding_model.dart';
import '../../routes.dart';

class OnboardingController extends GetxController {
  RxList<Onboarding> records = <Onboarding>[].obs;
  RxBool isLoading = false.obs;
  RxInt currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () {
      bool isOnboarding =
          (Cache.get(AppConfig.cacheIsOnboarding) == true) ? true : false;
      if (!isOnboarding) {
        Get.offAndToNamed(Routes.home);
      } else {
        loadInitialData();
      }
    });
  }

  Future<void> loadInitialData() async {
    isLoading(true);
    records.addAll([
      Onboarding(
        title: "Discover the Bhagavad Gita",
        text: "Explore timeless teachings for a peaceful and purposeful life.",
        image:
            "https://media.istockphoto.com/id/1741123022/vector/group-of-people-are-playing-christmas-word-charades-vector-illustration-in-a-minimalist.webp?s=1024x1024&w=is&k=20&c=-IAY6g-KzbeGb8ClmcTKLf5hXYxFFfgR3zBT0n6YNhA=",
      ),
      Onboarding(
        title: "Daily Inspirations",
        text: "Receive daily verses and reflections to guide your day.",
        image:
            "https://media.istockphoto.com/id/1741123022/vector/group-of-people-are-playing-christmas-word-charades-vector-illustration-in-a-minimalist.webp?s=1024x1024&w=is&k=20&c=-IAY6g-KzbeGb8ClmcTKLf5hXYxFFfgR3zBT0n6YNhA=",
      ),
      Onboarding(
        title: "Your Spiritual Companion",
        text: "Save your favorite verses and track your spiritual journey.",
        image:
            "https://media.istockphoto.com/id/1741123022/vector/group-of-people-are-playing-christmas-word-charades-vector-illustration-in-a-minimalist.webp?s=1024x1024&w=is&k=20&c=-IAY6g-KzbeGb8ClmcTKLf5hXYxFFfgR3zBT0n6YNhA=",
      ),
    ]);
    isLoading(false);
  }

  void changePage(int index) {
    currentPage.value = index;
  }

  getStarted() async {
    Cache.set(AppConfig.cacheIsOnboarding, false);
    Get.offAndToNamed(Routes.home);
  }
}
