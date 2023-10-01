import 'package:flutter/material.dart';
import '../config/config.dart';
import '../core/classes/classes.dart';
import '../widgets/widgets.dart';

class ExampleView extends StatelessWidget {
  const ExampleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MoonLightDrawer("Home"),
      appBar: const Navbar(title: "Examples"),
      bottomNavigationBar: const BannerAdWidget(),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: const Center(child: Text("Youtube Video")),
              onTap: () => Nav.toNamed(context, App.exampleYoutubeVideo),
            ),
            ListTile(
              title: const Center(child: Text("Firebase Remote Config")),
              onTap: () =>
                  Nav.toNamed(context, App.exampleFirebaseRemoteConfig),
            ),
            ListTile(
              title: const Center(child: Text("Auth UI Example")),
              onTap: () => Nav.toNamed(context, App.exampleAuth),
            ),
            ListTile(
              title: const Center(child: Text("Grid View")),
              onTap: () => Nav.toNamed(context, App.exampleGridView),
            ),
            ListTile(
              title: const Center(child: Text("Data Table")),
              onTap: () => Nav.toNamed(context, App.exampleDataTable),
            ),
            ListTile(
              title: const Center(child: Text("Paginated Data Table")),
              onTap: () => Nav.toNamed(context, App.examplePaginatedDataTable),
            ),
            ListTile(
              title: const Center(child: Text("Autocomplete")),
              onTap: () => Nav.toNamed(context, App.exampleAutocomplete),
            ),
            ListTile(
              title: const Center(child: Text("Load Local Image")),
              onTap: () => Nav.toNamed(context, App.exampleLoadLocalImage),
            ),
            ListTile(
              title: const Center(child: Text("Load Local JSON")),
              onTap: () => Nav.toNamed(context, App.exampleLoadLocalJson),
            ),
            ListTile(
              title: const Center(child: Text("Load More Using API")),
              onTap: () => Nav.toNamed(context, App.exampleLoadMoreUsingApi),
            ),
            ListTile(
              title: const Center(child: Text("Buttons Example")),
              onTap: () => Nav.toNamed(context, App.exampleButtons),
            ),
            ListTile(
              title: const Center(child: Text("Using Bottom Nav Bar Example")),
              onTap: () => Nav.toNamed(context, App.exampleUsingBottomNavBar),
            ),
            ListTile(
              title: const Center(child: Text("Using Alert Dialog")),
              onTap: () => Nav.toNamed(context, App.exampleUsingAlertDialog),
            ),
            ListTile(
              title: const Center(child: Text("Snack Bar")),
              onTap: () => Nav.toNamed(context, App.exampleSnackBar),
            ),
            ListTile(
              title: const Center(child: Text("Input Fields Example")),
              onTap: () => Nav.toNamed(context, App.exampleInputFields),
            ),
            ListTile(
              title: const Center(child: Text("Provider")),
              onTap: () => Nav.toNamed(context, App.exampleProvider),
            ),
            ListTile(
              title: const Center(child: Text("Check Internet Connection")),
              onTap: () =>
                  Nav.toNamed(context, App.exampleCheckInternetConnection),
            ),
          ],
        ),
      ),
    );
  }
}
