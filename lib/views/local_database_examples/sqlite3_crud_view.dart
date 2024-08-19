import 'package:flutter/material.dart';
import '../../controllers/controllers.dart';
import '../../widgets/widgets.dart';

class Sqlite3CRUDView extends StatefulWidget {
  const Sqlite3CRUDView({super.key});
  @override
  State<Sqlite3CRUDView> createState() => _Sqlite3CRUDViewState();
}

class _Sqlite3CRUDViewState extends State<Sqlite3CRUDView> {
  late ItemSqliteController _controller;
  @override
  void initState() {
    super.initState();
    _controller = ItemSqliteController(this);
    _controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: "Sqlite3 Crud (MVC)"),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _controller.showForm(context, null),
      ),
      body: _controller.isLoading
          ? fullScreenLoader()
          : (_controller.records.isEmpty)
              ? noDataFound()
              : ListView.builder(
                  itemCount: _controller.records.length,
                  itemBuilder: (context, index) => Card(
                    margin: const EdgeInsets.all(15),
                    child: ListTile(
                      title: Text(_controller.records[index]['title']),
                      subtitle: Text(_controller.records[index]['description']),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _controller.showForm(
                                  context, _controller.records[index]['id']),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _controller
                                  .deleteItem(_controller.records[index]['id']),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}
