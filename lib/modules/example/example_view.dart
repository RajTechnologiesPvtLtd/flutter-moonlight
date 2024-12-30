import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../core/classes/classes.dart';
import '../../widgets/widgets.dart';

class ExampleView extends StatelessWidget {
  const ExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: "Examples"),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: const Center(child: Text("Infinite Scroll Pagination")),
              onTap: () => Nav.toNamed(context, App.infiniteScrollPagination),
            ),
            ListTile(
              title: const Center(child: Text("Fetch Data From API")),
              onTap: () => Nav.toNamed(context, App.fetchDataFromAPI),
            ),
            ListTile(
              title: const Center(child: Text("Infinite Scroll Using API")),
              onTap: () => Nav.toNamed(context, App.infiniteScrollUsingApi),
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
              title: const Center(child: Text("Dynamic Tab Example")),
              onTap: () => Nav.toNamed(context, App.exampleDynamicTab),
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
              title: const Center(child: Text("Dynamic Multi Form")),
              onTap: () =>
                  Nav.toNamed(context, App.exampleDynamicMultiFormView),
            ),
            ListTile(
              title: const Center(child: Text("Top Search Bar")),
              onTap: () => Nav.toNamed(context, App.exampleTopSearchBar),
            ),
            ListTile(
              title: const Center(child: Text("Filter Chip")),
              onTap: () => Nav.toNamed(context, App.exampleFilterChip),
            ),
          ],
        ),
      ),
    );
  }
}
