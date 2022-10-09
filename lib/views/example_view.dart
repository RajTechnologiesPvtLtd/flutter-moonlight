import 'package:flutter/material.dart';
import '../constants/routes.dart';
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
                Navigator.pushNamed(context, exampleAuthViewRoute);
              },
            ),
            ListTile(
              title: Center(child: Text("Grid View")),
              onTap: () {
                Navigator.pushNamed(context, exampleGridViewRoute);
              },
            ),
            ListTile(
              title: Center(child: Text("Load Local Image")),
              onTap: () {
                Navigator.pushNamed(context, exampleLoadLocalImageRoute);
              },
            ),
            ListTile(
              title: Center(child: Text("Load Local JSON")),
              onTap: () {
                Navigator.pushNamed(context, exampleLoadLocalJsonRoute);
              },
            ),
            ListTile(
              title: Center(child: Text("Load More Using API")),
              onTap: () {
                Navigator.pushNamed(context, exampleLoadMoreUsingApi);
              },
            ),
            ListTile(
              title: Center(child: Text("Buttons Example")),
              onTap: () {
                Navigator.pushNamed(context, exampleButtons);
              },
            ),
            ListTile(
              title: Center(child: Text("Using Bottom Nav Bar Example")),
              onTap: () {
                Navigator.pushNamed(context, exampleUsingBottomNavBar);
              },
            ),
            ListTile(
              title: Center(child: Text("Using Alert Dialog")),
              onTap: () {
                Navigator.pushNamed(context, exampleUsingAlertDialog);
              },
            ),
            ListTile(
              title: Center(child: Text("Input Fields Example")),
              onTap: () {
                Navigator.pushNamed(context, exampleInputFields);
              },
            ),
          ],
        ),
      ),
    );
  }
}
