import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../widgets/widgets.dart';

class ItemController {
  final State _state;
  ItemModel recordModel = ItemModel();
  List<Map<String, dynamic>> records = [];
  bool isLoading = true;

  final TextEditingController _titleCtr = TextEditingController();
  final TextEditingController _descriptionCtr = TextEditingController();

  ItemController(this._state);

  init() {
    _refreshRecords();
  }

  _refreshRecords() async {
    final data = await recordModel.getAll();
    _state.setState(() {
      records = data;
      isLoading = false;
    });
  }

  _resetForm() {
    _titleCtr.text = '';
    _descriptionCtr.text = '';
  }

  Future<void> _addItem() async {
    await recordModel.store({
      'title': _titleCtr.text,
      'description': _descriptionCtr.text,
    });
    _showMessage("Successfully created a record!");
    _refreshRecords();
  }

  Future<void> _updateItem(int id) async {
    await recordModel.update(id, {
      'title': _titleCtr.text,
      'description': _descriptionCtr.text,
    });
    _showMessage("Successfully updated a record!");
    _refreshRecords();
  }

  void deleteItem(int id) async {
    await recordModel.delete(id);
    _showMessage("Successfully deleted a record!");
    _refreshRecords();
  }

  void _showMessage(String message) {
    final context = _state.context;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void showForm(BuildContext context, int? id) async {
    if (id != null) {
      final existingRecord =
          records.firstWhere((element) => element['id'] == id);
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
                bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MLTextField(
                    controller: _titleCtr,
                    labelText: 'Title',
                  ),
                  sizedBoxByHeight(20),
                  MLTextField(
                    controller: _descriptionCtr,
                    labelText: 'Description',
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (id == null) {
                        await _addItem();
                      } else {
                        await _updateItem(id);
                      }
                      _resetForm();
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Create' : 'Update'),
                  )
                ],
              ),
            ));
  }
}
