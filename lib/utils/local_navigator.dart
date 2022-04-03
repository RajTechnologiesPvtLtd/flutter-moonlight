import 'package:flutter/material.dart';

import '../constants/controllers.dart';
import '../routes/router.dart';
import '../routes/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: homePageRoute,
    );
