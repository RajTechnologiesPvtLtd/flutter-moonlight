import 'package:flutter/material.dart';

export 'navbar.dart';
export 'drawer.dart';
export 'drawer-tile.dart';
// Specific Widgets
export 'permission_dialog.dart';
//
export 'pagination_controls.dart';
// Google Mobile Ads
export 'banner_ad_widget.dart';
// Fields
export 'fields/input_decoration.dart';
export 'fields/ml_text_field.dart';
export 'fields/ml_password_field.dart';
// Reusable Widgets
export 'youtube_video_player.dart';

showMessage(BuildContext context, String massage) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(massage),
  ));
}

Widget onScreenLoader() {
  return const Padding(
    padding: EdgeInsets.only(top: 10, bottom: 40),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget noMoreContent() {
  return Container(
    padding: const EdgeInsets.only(top: 15, bottom: 15),
    // color: Colors.amber,
    child: const Center(
      child: Text('You have fetched all of the content'),
    ),
  );
}

Widget noDataFound() {
  return const Center(
    child: Text('No Data Found'),
  );
}

Widget fullScreenLoader() {
  return const Scaffold(
    body: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
