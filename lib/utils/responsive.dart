import 'dart:developer';

import 'package:flutter/material.dart';

import '../constants/app.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;
  final Widget? customScreen;

  const ResponsiveWidget(
      {Key? key,
      required this.largeScreen,
      this.mediumScreen,
      this.smallScreen,
      this.customScreen})
      : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < mTabletBreakpoint;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= mTabletBreakpoint &&
        MediaQuery.of(context).size.width < mDesktopBreakPoint;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > mDesktopBreakPoint;
  }

  static bool isCustomSize(BuildContext context) {
    return MediaQuery.of(context).size.width <= customScreenSize &&
        MediaQuery.of(context).size.width >= mTabletBreakpoint;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double _width = constraints.maxWidth;
      inspect(_width);
      if (_width >= mDesktopBreakPoint) {
        return largeScreen;
      } else if (_width < mDesktopBreakPoint && _width >= mTabletBreakpoint) {
        return mediumScreen ?? largeScreen;
      } else {
        return smallScreen ?? largeScreen;
      }
    });
  }
}
