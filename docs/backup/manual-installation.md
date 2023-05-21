# MoonLight Manual Installation

# Directory Structure

- [MoonLight Manual Installation](#moonlight-manual-installation)
- [Directory Structure](#directory-structure)
  - [The Constants Directory](#the-constants-directory)
    - [app.dart File](#appdart-file)
    - [breakpoints.dart File](#breakpointsdart-file)
    - [colors.dart File](#colorsdart-file)
    - [images.dart File](#imagesdart-file)
  - [The Controllers Directory](#the-controllers-directory)
  - [The Models Directory](#the-models-directory)
  - [The Services Directory](#the-services-directory)
  - [The Utils Directory](#the-utils-directory)
  - [The Views Directory](#the-views-directory)
    - [home_view.dart File](#home_viewdart-file)
  - [The Widgets Directory](#the-widgets-directory)
- [Google Fonts Package (google_fonts)](#google-fonts-package-google_fonts)
  - [Installation](#installation)



```dart
lib
|───constants
|    │──app.dart
|    │──breakpoints.dart
|    │──colors.dart
|    └──images.dart
|───controllers
|───models
|───services
|───utils
|───views
|───widgets
└───main.dart
```

## The Constants Directory

### app.dart File 

```dart
  const APP_NAME = "assets/images/logo.jpg";
```

### breakpoints.dart File 

```dart
    const DESKTOP_BREAK_POINT = 992;
    const TABLET_BREAK_POINT = 768;
    const MOBILE_BREAK_POINT = 576;
    const CUSTOM_BREAK_POINT = 1100;
    const mSideMenuWidth = 224; // for sidemenu
    const mNavigationRailWidth = 72.0; // for navigation rail
```

### colors.dart File 

```dart
    // const Color light = Color(0xFFF7F8FC);
    // const Color lightGrey = Color(0xFFA4A6B3);
    // const Color dark = Color(0xFF363740);
    // const Color active = Color(0xFF3C19C0);
```

### images.dart File 

```dart
   const APP_LOGO = "assets/images/logo.jpg";
```

## The Controllers Directory
## The Models Directory
## The Services Directory
## The Utils Directory
## The Views Directory

### home_view.dart File 

```dart
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MoonLight")),
      body: Center(
        child: Text("Welcome to Flutter Moonlight Framework"),
      ),
    );
  }
}

```

## The Widgets Directory

# Google Fonts Package (google_fonts)

## Installation

```bash
  flutter pub add google_fonts
```