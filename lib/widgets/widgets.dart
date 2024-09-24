import 'package:flutter/material.dart';

export 'navbar.dart';
export 'drawer.dart';
export 'drawer-tile.dart';
// Specific Widgets
export 'permission_dialog.dart';
export 'pagination_controls.dart';
// Google Mobile Ads
export 'ads/banner_ad_widget.dart';
// Fields
export 'input.dart';
// Reusable Widgets
export 'youtube_video_player.dart';

showMessage(BuildContext context, String massage) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(massage),
    ),
  );
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

Widget sizedBoxByHeight(double height) {
  return SizedBox(height: height);
}

Widget sizedBoxByWidth(double width) {
  return SizedBox(width: width);
}

Widget mlButton(String label, void Function() click) {
  return ElevatedButton(
    // style: ElevatedButton.styleFrom(
    //   backgroundColor: ColorScheme.light().primary,
    //   textStyle: TextStyle(
    //     color: ColorScheme.light().primary,
    //   ),
    // ),
    onPressed: click,
    child: Text(label),
  );
}

Widget mlTextButton(String label, void Function() click) {
  return TextButton(
    onPressed: click,
    child: Text(label),
  );
}
