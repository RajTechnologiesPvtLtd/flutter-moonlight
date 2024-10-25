import '../core/classes/classes.dart';
import '../modules/modules.dart';
// Bloc
import '../bloc/data/repository/todo_sql_repository.dart';
import '../bloc/presentation/item_page.dart';
// GetX
import '../getx/app.dart';

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
  // Ads Examples
  static const String exampleAds = '${App.name}/example-ads';
  static const String bannerAds = '${App.name}/banner-ads';
  static const String interstitialAds = '${App.name}/interstitial-ads';
  // static const String nativeAds = '${App.name}/native-ads';
  // static const String rewardedAds = '${App.name}/rewarded-ads';
  static const String exampleBloc = "/example-bloc";
  static const String exampleGetx = "/example-getx";
  // Modules
  static const String infiniteScrollPagination =
      '${App.name}/infinite-scroll-pagination';
  static const String infiniteScrollUsingApi =
      '${App.name}/infinite-scroll-using-api';
  static const String fetchDataFromAPI = '${App.name}/fetch-data-from-api';
  // Package Examples
  static const String packageExamples = '${App.name}/package-examples';

  //MVC
  static const String exampleMVC = "/example-mvc";
  static const String exampleCounterMVC = "/counter-mvc";
  static const String loadMoreMVC = '${App.name}/load-more-mvc';
  static const String sqlMV = '${App.name}/sql-mv';
  static const String sqlMVC = '${App.name}/sql-mvc';
  static const String sqfliteMVC = '${App.name}/sqflite-mvc';
  // Auth system
  static const String loginAuth = '${App.name}/login';
  // Examples
  static const String exampleProvider = '${App.name}/provider';
  static const String exampleAuth = "/auth";
  static const String exampleGridView = "/grid-view";
  static const String exampleLoadLocalImage = "/load-local-image";
  static const String exampleLoadLocalJson = "/load-local-json";
  static const String exampleLoadMoreUsingApi = "/load-more-using-api";
  static const String exampleButtons = "/buttons-example";
  static const String exampleInputFields = "/input-fields-example";
  static const String exampleUsingAlertDialog = "/using-alert-dialog-example";
  static const String exampleUsingBottomNavBar = "/using-bottom-nav-bar";
  static const String exampleDynamicTab = "/dynamic-tab";
  static const String exampleSnackBar = "/snack-bar";
  static const String examplePermissionHandler = "/permission-handler";
  static const String exampleCheckInternetConnection =
      "/check-internet-connection";
  static const String exampleYoutubeVideo = "/youtube-video";
  static const String exampleDataTable = "/data-table";
  static const String examplePaginatedDataTable = "/paginated-data-table";
  static const String exampleFirebaseRemoteConfig = "/firebase-remote-config";
  static const String exampleAutocomplete = "/autocomplete";
  static const String exampleGeoLocation = "/geo-location";

  App() {
    addRoute(App.home, (context) => const HomeView());
    addRoute(App.setting, (context) => const SettingView());
    addRoute(App.loadMore, (context) => const LoadMoreView());
    addRoute(App.loadMoreWithCache, (context) => const LoadMoreWithCacheView());
    addRoute(App.sqlCrud, (context) => const SqlCRUDView());
    addRoute(App.localNotification, (context) => const LocalNotificationView());
    addRoute(App.example, (context) => const ExampleView());
    // Ads Examples
    addRoute(App.exampleAds, (context) => const ExampleAdsView());
    addRoute(App.bannerAds, (context) => const BannerAdsView());
    addRoute(App.interstitialAds, (context) => const InterstitialAdsView());
    // addRoute(App.nativeAds, (context) => const NativeAdsView());
    // addRoute(App.rewardedAds, (context) => const RewardedAdsView());
    addRoute(
        App.exampleBloc,
        (context) => ItemPage(
              repository: ItemSqlRepository(),
            ));
    addRoute(App.exampleGetx, (context) => const GetxApp());

    // Modules
    addRoute(App.infiniteScrollPagination,
        (context) => const InfiniteScrollPaginationView());
    addRoute(App.infiniteScrollUsingApi,
        (context) => const InfiniteScrollUsingAPIView());
    addRoute(App.fetchDataFromAPI, (context) => const FetchDataFromAPIView());
    addRoute(App.packageExamples, (context) => const PackageExampleView());
    //MVC
    addRoute(App.exampleMVC, (context) => const ExampleMVCView());
    addRoute(App.exampleCounterMVC, (context) => const CounterView());
    addRoute(App.loadMoreMVC, (context) => const LoadMoreViewMVC());
    addRoute(App.sqlMV, (context) => const SqlView());
    addRoute(App.sqlMVC, (context) => const ItemView());
    addRoute(App.sqfliteMVC, (context) => const SqfliteView());
    // Auth System
    addRoute(App.loginAuth, (context) => const LoginView());
    // Examples
    addRoute(App.exampleProvider, (context) => const ProviderView());
    addRoute(App.exampleAuth, (context) => const AuthView());
    addRoute(App.exampleGridView, (context) => const GridViewPage());
    addRoute(
        App.exampleLoadLocalImage, (context) => const LoadLocalImagePage());
    addRoute(App.exampleLoadLocalJson, (context) => const LoadLocalJSONPage());
    addRoute(
        App.exampleLoadMoreUsingApi, (context) => const LoadMoreUsingAPIPage());
    addRoute(App.exampleButtons, (context) => const ButtonsExample());
    addRoute(App.exampleInputFields, (context) => const InputFieldsExample());
    addRoute(
        App.exampleUsingAlertDialog, (context) => const UsingAlertDialogView());
    addRoute(App.exampleSnackBar, (context) => const SnackBarView());
    addRoute(App.examplePermissionHandler,
        (context) => const PermissionHandlerView());
    addRoute(App.exampleUsingBottomNavBar,
        (context) => const UsingBottomNavBarView());
    addRoute(App.exampleDynamicTab, (context) => const DynamicTabView());
    addRoute(App.exampleCheckInternetConnection,
        (context) => const CheckInternetConnectionView());
    addRoute(App.exampleYoutubeVideo, (context) => const YoutubeVideoView());
    addRoute(App.exampleDataTable, (context) => const DataTableView());
    addRoute(App.examplePaginatedDataTable,
        (context) => const PaginatedDataTableView());
    addRoute(App.exampleFirebaseRemoteConfig,
        (context) => const FirebaseRemoteConfigView());
    addRoute(
        App.exampleAutocomplete,
        (context) => const DropdownWithSearch(
              options: [
                'Apple',
                'Banana',
                'Cherry',
                'Grape',
                'Lemon',
                'Orange',
                'Strawberry',
                'Watermelon',
              ],
            ));
    addRoute(App.exampleGeoLocation, (context) => const GeoLocationView());
  }
}
