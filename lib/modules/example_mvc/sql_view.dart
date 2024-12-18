import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';

class SqlView extends StatefulWidget {
  const SqlView({super.key});
  @override
  State<SqlView> createState() => _SqlViewState();
}

class _SqlViewState extends State<SqlView> {
  final ItemModel _recordModel = ItemModel();

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
    final data = await _recordModel.getAll();
    setState(() {
      _records = data;
      _isLoading = false;
    });
  }

  _resetForm() {
    _titleCtr.text = '';
    _descriptionCtr.text = '';
  }

  _saveRecord(int? id) async {
    String msg = '';
    if (id != null) {
      await _recordModel.update(id, {
        'title': _titleCtr.text,
        'description': _descriptionCtr.text,
      });
    } else {
      await _recordModel.store({
        'title': _titleCtr.text,
        'description': _descriptionCtr.text,
      });
      msg = "Successfully created a record!";
    }
    _resetForm();
    showMessage(context, msg);
    _refreshRecords();
    Navigator.pop(context);
  }

  _deleteItem(int id) async {
    await _recordModel.delete(id);
    showMessage(context, "Successfully deleted a record!");
    _refreshRecords();
  }

  _showForm(int? id) async {
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
            MLTextField(labelText: "Title", controller: _titleCtr),
            const SizedBox(
              height: 10,
            ),
            MLTextField(labelText: "Description", controller: _descriptionCtr),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => _saveRecord(id),
              child: Text(id == null ? 'Create New' : 'Update'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: "Sql View (MVC) [Sqflite]"),
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
