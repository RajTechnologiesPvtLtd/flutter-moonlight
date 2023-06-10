import '../controllers/controllers.dart';
import '../core/classes/classes.dart';
import '../views/views.dart';

class Routes extends RouteManager {
  Routes() {
    addAll(App().routes);
  }
}

class App extends RouteManager {
  static const String name = '';
  static const String home = '${App.name}/';
  static const String loadMore = '${App.name}/load-more';
  static const String loadMoreWithCache = '${App.name}/load-more-with-cache';
  static const String sqlCrud = '${App.name}/sql-crud';
  static const String localNotification = '${App.name}/local-notification';
  static const String example = '${App.name}/examples';
  static const String setting = '${App.name}/setting';
  //MVC
  static const String loadMoreMVC = '${App.name}/load-more-mvc';
  // Auth system
  static const String loginAuth = '${App.name}/login';
  // Examples
  static const String exampleAuth = "/auth";
  static const String exampleGridView = "/grid-view";
  static const String exampleLoadLocalImage = "/load-local-image";
  static const String exampleLoadLocalJson = "/load-local-json";
  static const String exampleLoadMoreUsingApi = "/load-more-using-api";
  static const String exampleButtons = "/buttons-example";
  static const String exampleInputFields = "/input-fields-example";
  static const String exampleUsingAlertDialog = "/using-alert-dialog-example";
  static const String exampleUsingBottomNavBar = "/using-bottom-nav-bar";
  static const String exampleSnackBar = "/snack-bar";
  static const String exampleCheckInternetConnection =
      "/check-internet-connection";
  static const String exampleYoutubeVideo = "/youtube-video";
  App() {
    addRoute(App.home, (context) => HomeView());
    addRoute(App.setting, (context) => const SettingView());
    addRoute(App.loadMore, (context) => const LoadMoreView());
    addRoute(App.loadMoreWithCache, (context) => const LoadMoreWithCacheView());
    addRoute(App.sqlCrud, (context) => const SqlCRUDView());
    addRoute(App.localNotification, (context) => const LocalNotificationView());
    addRoute(App.example, (context) => const ExampleController());
    //MVC
    addRoute(App.loadMoreMVC, (context) => const LoadMoreViewMVC());
    // Auth System
    addRoute(App.loginAuth, (context) => const LoginView());
    // Examples
    addRoute(App.exampleAuth, (context) => const AuthView());
    addRoute(App.exampleGridView, (context) => GridViewPage());
    addRoute(App.exampleLoadLocalImage, (context) => LoadLocalImagePage());
    addRoute(App.exampleLoadLocalJson, (context) => LoadLocalJSONPage());
    addRoute(
        App.exampleLoadMoreUsingApi, (context) => const LoadMoreUsingAPIPage());
    addRoute(App.exampleButtons, (context) => const ButtonsExample());
    addRoute(App.exampleInputFields, (context) => const InputFieldsExample());
    addRoute(
        App.exampleUsingAlertDialog, (context) => const UsingAlertDialogView());
    addRoute(App.exampleSnackBar, (context) => const SnackBarView());
    addRoute(
        App.exampleUsingBottomNavBar, (context) => UsingBottomNavBarView());
    addRoute(App.exampleCheckInternetConnection,
        (context) => CheckInternetConnectionView());
    addRoute(App.exampleYoutubeVideo, (context) => const YoutubeVideoView());
  }
}
