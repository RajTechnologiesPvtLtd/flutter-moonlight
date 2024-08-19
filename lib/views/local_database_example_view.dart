import 'package:flutter/material.dart';
import '../config/config.dart';
import '../core/classes/classes.dart';
import '../widgets/widgets.dart';

class LocalDatabaseExampleView extends StatelessWidget {
  const LocalDatabaseExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: "Examples"),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: const Center(child: Text("Sqflite Crud")),
              onTap: () => Nav.toNamed(context, App.sqfliteCrud),
            ),
            ListTile(
              title: const Center(child: Text("Sqflite Crud (MVC)")),
              onTap: () => Nav.toNamed(context, App.sqlMVC),
            ),
            ListTile(
              title: const Center(child: Text("Sqlite3 Crud (MVC)")),
              onTap: () => Nav.toNamed(context, App.sqlite3Crud),
            ),
          ],
        ),
      ),
    );
  }
}
