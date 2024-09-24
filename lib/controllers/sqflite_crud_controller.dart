import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class SqfliteCrudController {
  final State _state;
  final repository; // Repository
  late List<Map<String, dynamic>> fields;
  SqfliteCrudController(this._state, this.repository, this.fields);

  List<Map<String, dynamic>> records = [];
  bool isLoading = true;
  Map<String, dynamic>? queryParams;

  // form methods
  init() async {
    refreshRecords(queryParams: queryParams);
    initializeControllers();
  }

  disposeControllers() {
    for (var field in fields) {
      controllers[field['name']]?.dispose();
    }
  }

  refreshRecords({
    Map<String, dynamic>? queryParams = const {},
  }) async {
    final data = await repository.getAll(queryParams: queryParams);

    _state.setState(() {
      records = data;
      isLoading = false;
    });
  }

  showMessage(String message) {
    final context = _state.context;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // Form Start
  Map<String, TextEditingController> controllers = {};

  initializeControllers() {
    for (var field in fields) {
      controllers[field['name']] = TextEditingController();
    }
  }

  resetForm() {
    for (var field in fields) {
      controllers[field['name']]?.text = '';
    }
  }

  delete(int id) async {
    await repository.delete(id);
    showMessage("Successfully deleted a record!");
    refreshRecords(queryParams: queryParams);
  }

  Future<void> save(int? id) async {
    Map<String, dynamic> data = {};
    for (var field in fields) {
      data[field['name']] = controllers[field['name']]?.text;
    }
    if (id == null) {
      await repository.store(data);
      showMessage("Successfully created a record!");
    } else {
      await repository.update(id, data);
      showMessage("Successfully updated a record!");
    }
    refreshRecords(queryParams: queryParams);
  }

  buildFormFields() {
    return fields.map(
      (field) {
        if (field['type'] == 'text') {
          return MLTextField(
            controller: controllers[field['name']]!,
            labelText: field['label'],
          );
        } else if (field['type'] == 'number') {
          return MLNumberField(
            controller: controllers[field['name']]!,
            labelText: field['label'],
          );
        } else if (field['type'] == 'select') {
          return MLSelectField(
            labelText: field['label'],
            controller: controllers[field['name']]!,
            items: field['options'].map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value['id'].toString(),
                child: Text(value['name']),
              );
            }).toList(),
          );
        } else if (field['type'] == 'datetime') {
          return MLDateTimeField(
            labelText: field['label'],
            controller: controllers[field['name']]!,
          );
        } else {
          return Container(); // Handle other types if necessary
        }
      },
    );
  }

  showModalBottomSheetForm(BuildContext context, int? id) {
    if (id != null) {
      final existingRecord = records.firstWhere(
        (element) => element['id'] == id,
        orElse: () => {}, // Return an empty map if no matching record is found
      );

      for (var field in fields) {
        // Safely assign the value to the controller if it exists
        controllers[field['name']]?.text =
            existingRecord[field['name']].toString();
      }
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
            if (fields.isNotEmpty) ...buildFormFields(),
            mlTextButton(
              id == null ? 'Create' : 'Update',
              () async {
                await save(id);
                resetForm();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  showModalBottomModalForm(
      BuildContext context, int? id, Map<String, String> data) {
    if (id != null) {
      final existingRecord = records.firstWhere(
        (element) => element['id'] == id,
        orElse: () => {}, // Return an empty map if no matching record is found
      );
      for (var field in fields) {
        // Safely assign the value to the controller if it exists
        controllers[field['name']]?.text =
            existingRecord[field['name']].toString();
      }
    } else {
      if (data.isNotEmpty) {
        for (var field in fields) {
          // Safely assign the value to the controller if it exists
          controllers[field['name']]?.text = data[field['name']] ?? '';
        }
      }
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // contentPadding: EdgeInsets.only(
          //   top: 15,
          //   left: 15,
          //   right: 15,
          //   bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          // ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (fields.isNotEmpty) ...buildFormFields(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (id) != null
                        ? mlTextButton(
                            'Delete',
                            () async {
                              delete(id!);
                              resetForm();
                              Navigator.of(context).pop();
                            },
                          )
                        : Container(),
                    Row(
                      children: [
                        mlTextButton(
                          'Cancel',
                          () {
                            Navigator.of(context).pop();
                          },
                        ),
                        mlTextButton(
                          id == null ? 'Create' : 'Update',
                          () async {
                            await save(id);
                            resetForm();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
