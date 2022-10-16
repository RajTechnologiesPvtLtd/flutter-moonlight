import 'package:flutter/material.dart';
import '../config/config.dart';
import '../widgets/widget.dart';

class ExampleView extends StatelessWidget {
  const ExampleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MoonLightDrawer("Examples"),
      appBar: AppBar(title: Text("Examples")),
      bottomNavigationBar: BannerAdWidget(),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: Center(child: Text("Auth UI Example")),
              onTap: () {
                Navigator.pushNamed(context, App.exampleAuth);
              },
            ),
            ListTile(
              title: Center(child: Text("Grid View")),
              onTap: () {
                Navigator.pushNamed(context, App.exampleGridView);
              },
            ),
            ListTile(
              title: Center(child: Text("Load Local Image")),
              onTap: () {
                Navigator.pushNamed(context, App.exampleLoadLocalImage);
              },
            ),
            ListTile(
              title: Center(child: Text("Load Local JSON")),
              onTap: () {
                Navigator.pushNamed(context, App.exampleLoadLocalJson);
              },
            ),
            ListTile(
              title: Center(child: Text("Load More Using API")),
              onTap: () {
                Navigator.pushNamed(context, App.exampleLoadMoreUsingApi);
              },
            ),
            ListTile(
              title: Center(child: Text("Buttons Example")),
              onTap: () {
                Navigator.pushNamed(context, App.exampleButtons);
              },
            ),
            ListTile(
              title: Center(child: Text("Using Bottom Nav Bar Example")),
              onTap: () {
                Navigator.pushNamed(context, App.exampleUsingBottomNavBar);
              },
            ),
            ListTile(
              title: Center(child: Text("Using Alert Dialog")),
              onTap: () {
                Navigator.pushNamed(context, App.exampleUsingAlertDialog);
              },
            ),
            ListTile(
              title: Center(child: Text("Snack Bar")),
              onTap: () {
                Navigator.pushNamed(context, App.exampleSnackBar);
              },
            ),
            ListTile(
              title: Center(child: Text("Input Fields Example")),
              onTap: () {
                Navigator.pushNamed(context, App.exampleInputFields);
              },
            ),
            ListTile(
              title: Center(child: Text("Check Internet Connection")),
              onTap: () {
                Navigator.pushNamed(
                    context, App.exampleCheckInternetConnection);
              },
            ),
          ],
        ),
      ),
    );
  }
}
