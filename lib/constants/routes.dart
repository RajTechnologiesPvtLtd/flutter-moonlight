import 'package:flutter/material.dart';
import 'package:moonlight/views/settings_view.dart';

import '../views/example/auth_view.dart';
import '../views/example/buttons_view.dart';
import '../views/example/grid_view.dart';
import '../views/example/input_fields_example.dart';
import '../views/example/load_local_image.dart';
import '../views/example/load_local_json.dart';
import '../views/example/load_more_using_api.dart';
import '../views/example/using_alert_dialog.dart';
import '../views/example/using_bottom_nav_bar.dart';
import '../views/example_view.dart';
import '../views/home_view.dart';

//Routes Name Define
const rootRoute = "/";
const SettingsRoute = "/settings";
const ExampleRoute = "/example";

const AuthViewRoute = "/auth";
const GridViewRoute = "/grid-view";
const LoadLocalImageRoute = "/load-local-image";
const LoadLocalJSONRoute = "/load-local-json";
const LoadMoreUsingAPIRoute = "/load-more-using-api";
const ButtonsExampleRoute = "/buttons-example";
const InputFieldsExampleRoute = "/input-fields-example";
const UsingAlertDialogRoute = "/using-alert-dialog-example";
const UsingBottomNavBarExampleRoute = "/using-bottom-nav-bar";

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case rootRoute:
        return MaterialPageRoute(builder: (_) => HomeView());
      case SettingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsView());
      case ExampleRoute:
        return MaterialPageRoute(builder: (_) => ExampleView());
      case ExampleRoute:
        return MaterialPageRoute(builder: (_) => ExampleView());
      //Example Pages
      case AuthViewRoute:
        return MaterialPageRoute(builder: (_) => AuthView());
      case GridViewRoute:
        return MaterialPageRoute(builder: (_) => GridViewPage());
      case LoadLocalImageRoute:
        return MaterialPageRoute(builder: (_) => LoadLocalImagePage());
      case LoadLocalJSONRoute:
        return MaterialPageRoute(builder: (_) => LoadLocalJSONPage());
      case LoadMoreUsingAPIRoute:
        return MaterialPageRoute(builder: (_) => LoadMoreUsingAPIPage());
      case ButtonsExampleRoute:
        return MaterialPageRoute(builder: (_) => ButtonsExample());
      case InputFieldsExampleRoute:
        return MaterialPageRoute(builder: (_) => InputFieldsExample());
      case UsingAlertDialogRoute:
        return MaterialPageRoute(builder: (_) => UsingAlertDialogView());
      case UsingBottomNavBarExampleRoute:
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
        return _errorRoute();
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
