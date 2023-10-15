import 'package:flutter/material.dart';
import '../../controllers/controllers.dart';
import '../../widgets/widgets.dart';

class SqlView extends StatefulWidget {
  const SqlView({Key? key}) : super(key: key);
  @override
  State<SqlView> createState() => _SqlViewState();
}

class _SqlViewState extends State<SqlView> {
  final SqlController _controller = SqlController();

  List<Map<String, dynamic>> _records = [];
  bool _isLoading = true;
  // Form
  final TextEditingController _titleCtr = TextEditingController();
  final TextEditingController _descriptionCtr = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _controller.orderBy = "title";
    _refreshRecords();
  }

  _refreshRecords() async {
    final data = await _controller.list();
    setState(() {
      _records = data;
      _isLoading = false;
    });
  }

  void _showForm(int? id) async {
    if (id != null) {
      final existingRecord =
          _records.firstWhere((element) => element['id'] == id);
      _titleCtr.text = existingRecord['title'];
      _descriptionCtr.text = existingRecord['description'];
    }
    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  mlTextField(labelText: "Title", controller: _titleCtr),
                  const SizedBox(
                    height: 10,
                  ),
                  mlTextField(
                      labelText: "Description", controller: _descriptionCtr),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (id != null) {
                        await _updateItem(id);
                      } else {
                        await _addItem();
                      }
                      // Clear the text fields
                      _titleCtr.text = '';
                      _descriptionCtr.text = '';
                      // Close the bottom sheet
                      Navigator.pop(context);
                    },
                    child: Text(id == null ? 'Create New' : 'Update'),
                  )
                ],
              ),
            ));
  }

  // Insert a new record to the database
  Future<void> _addItem() async {
    await _controller.store({
      'title': _titleCtr.text,
      'description': _descriptionCtr.text,
    });
    showMessage(context, "Successfully created a record!");
    _refreshRecords();
  }

  // Update an existing record
  Future<void> _updateItem(int id) async {
    await _controller.update(id, {
      'title': _titleCtr.text,
      'description': _descriptionCtr.text,
    });
    showMessage(context, "Successfully update a record!");
    _refreshRecords();
  }

// Delete an item
  void _deleteItem(int id) async {
    await _controller.delete(id);
    showMessage(context, "Successfully deleted a record!");
    _refreshRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MoonLightDrawer("Sql View (MVC)"),
      appBar: const Navbar(title: "Sql View (MVC)"),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
      body: _isLoading
          ? fullScreenLoader()
          : (_records.isEmpty)
              ? noDataFound()
              : ListView.builder(
                  itemCount: _records.length,
                  itemBuilder: (context, index) => Card(
                    margin: const EdgeInsets.all(15),
                    child: ListTile(
                        title: Text(_records[index]['title']),
                        subtitle: Text(_records[index]['description']),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () =>
                                    _showForm(_records[index]['id']),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () =>
                                    _deleteItem(_records[index]['id']),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
    );
  }
}
