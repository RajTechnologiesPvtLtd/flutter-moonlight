import 'package:flutter/material.dart';
import '../utils.dart';
import '../config/config.dart';

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

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'Brazil',
    'Argentina',
    'USA',
    'Canada',
    'Mexico',
    'Germany',
    'France',
    'Italy',
    'India',
    'Spain',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        },
      );

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(query),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = query.isEmpty
        ? searchResults
        : searchResults
            .where((element) =>
                element.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}

Widget generateCircleAvatar({
  required String name,
  Color backgroundColor = Colors.blue,
  Color textColor = Colors.white,
  double radius = 20.0,
}) {
  return CircleAvatar(
    radius: radius,
    backgroundColor: backgroundColor,
    child: Text(
      name.getInitials(),
      style: TextStyle(color: textColor),
    ),
  );
}

Widget mlImage(String imageUrl,{
  String? name
}) {
return Image.network(
    imageUrl,
    width: 50,
    height: 50,
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) {
      if (name != null && name.trim().isNotEmpty) {
        return generateCircleAvatar(name: name);
      }
      return Image.asset(
        AppConfig.defaultLogo,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      );
    },
  );
}