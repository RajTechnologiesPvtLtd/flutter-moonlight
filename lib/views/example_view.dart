import 'package:flutter/material.dart';
import '../constants/app.dart';
import '../constants/routes.dart';
import '../widgets/drawer.dart';

class ExampleView extends StatelessWidget {
  const ExampleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MoonLightDrawer("Examples"),
      appBar: AppBar(title: Text("Examples")),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: Center(child: Text("Auth UI Example")),
              onTap: () {
                Navigator.pushNamed(context, AuthViewRoute);
              },
            ),
            ListTile(
              title: Center(child: Text("Grid View")),
              onTap: () {
                Navigator.pushNamed(context, GridViewRoute);
              },
            ),
            ListTile(
              title: Center(child: Text("Load Local Image")),
              onTap: () {
                Navigator.pushNamed(context, LoadLocalImageRoute);
              },
            ),
            ListTile(
              title: Center(child: Text("Load Local JSON")),
              onTap: () {
                Navigator.pushNamed(context, LoadLocalJSONRoute);
              },
            ),
            ListTile(
              title: Center(child: Text("Load More Using API")),
              onTap: () {
                Navigator.pushNamed(context, LoadMoreUsingAPIRoute);
              },
            ),
            ListTile(
              title: Center(child: Text("Buttons Example")),
              onTap: () {
                Navigator.pushNamed(context, ButtonsExampleRoute);
              },
            ),
            ListTile(
              title: Center(child: Text("Using Bottom Nav Bar Example")),
              onTap: () {
                Navigator.pushNamed(context, UsingBottomNavBarExampleRoute);
              },
            ),
            ListTile(
              title: Center(child: Text("Using Alert Dialog")),
              onTap: () {
                Navigator.pushNamed(context, UsingAlertDialogRoute);
              },
            ),
            ListTile(
              title: Center(child: Text("Input Fields Example")),
              onTap: () {
                Navigator.pushNamed(context, InputFieldsExampleRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
