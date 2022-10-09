import 'package:flutter/material.dart';
import 'package:moonlight/controllers/load_more_controller.dart';
import '../controllers/controllers.dart';
import '../views/example/example_views.dart';

//Routes Name Define
const rootRoute = "/";
const loadMoreRoute = "/load-more";
const settingRoute = "/settings";
const exampleRoute = "/examples";

const exampleAuthViewRoute = "/auth";
const exampleGridViewRoute = "/grid-view";
const exampleLoadLocalImageRoute = "/load-local-image";
const exampleLoadLocalJsonRoute = "/load-local-json";
const exampleLoadMoreUsingApi = "/load-more-using-api";
const exampleButtons = "/buttons-example";
const exampleInputFields = "/input-fields-example";
const exampleUsingAlertDialog = "/using-alert-dialog-example";
const exampleUsingBottomNavBar = "/using-bottom-nav-bar";

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case rootRoute:
        return MaterialPageRoute(builder: (_) => HomeController());
      case loadMoreRoute:
        return MaterialPageRoute(builder: (_) => LoadMoreController());
      case settingRoute:
        return MaterialPageRoute(builder: (_) => SettingController());
      case exampleRoute:
        return MaterialPageRoute(builder: (_) => ExampleController());
      //Example Pages
      case exampleAuthViewRoute:
        return MaterialPageRoute(builder: (_) => AuthView());
      case exampleGridViewRoute:
        return MaterialPageRoute(builder: (_) => GridViewPage());
      case exampleLoadLocalImageRoute:
        return MaterialPageRoute(builder: (_) => LoadLocalImagePage());
      case exampleLoadLocalJsonRoute:
        return MaterialPageRoute(builder: (_) => LoadLocalJSONPage());
      case exampleLoadMoreUsingApi:
        return MaterialPageRoute(builder: (_) => LoadMoreUsingAPIPage());
      case exampleButtons:
        return MaterialPageRoute(builder: (_) => ButtonsExample());
      case exampleInputFields:
        return MaterialPageRoute(builder: (_) => InputFieldsExample());
      case exampleUsingAlertDialog:
        return MaterialPageRoute(builder: (_) => UsingAlertDialogView());
      case exampleUsingBottomNavBar:
        return MaterialPageRoute(builder: (_) => UsingBottomNavBarView());
      // case '/second':
      //   // Validation of correct data type
      //   if (args is String) {
      //     return MaterialPageRoute(
      //       builder: (_) => SecondPage(
      //         data: args,
      //       ),
      //     );
      //   }
      // If args is not of the correct type, return an error page.
      // You can also throw an exception while in development.
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
