import 'package:flutter/material.dart';

import '../../controllers/sqflite_item_controller.dart';
import '../../widgets/widgets.dart';

class SqfliteView extends StatefulWidget {
  const SqfliteView({super.key});

  @override
  State<SqfliteView> createState() => _SqfliteViewState();
}

class _SqfliteViewState extends State<SqfliteView> {
  late SqfliteItemController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SqfliteItemController(this);
    _controller.init();
  }

  @override
  void dispose() {
    _controller.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: "Sqflite and Dynamic Form"),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _controller.showModalBottomSheetForm(context, null),
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
                                onPressed: () =>
                                    _controller.showModalBottomSheetForm(
                                        context,
                                        _controller.records[index]['id'])),
                            IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => _controller
                                    .delete(_controller.records[index]['id'])),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}
