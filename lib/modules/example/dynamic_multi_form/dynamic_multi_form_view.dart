import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_form_item_widget.dart';
import 'contact_model.dart';

class DynamicMultiFormView extends StatefulWidget {
  const DynamicMultiFormView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DynamicMultiFormViewState();
  }
}

class _DynamicMultiFormViewState extends State<DynamicMultiFormView> {
  List<ContactFormItemWidget> contactForms = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic Multi Form"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.orange),
          ),
          onPressed: () {
            onSave();
          },
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
        onPressed: () {
          onAdd();
        },
      ),
      body: contactForms.isNotEmpty
          ? ListView.builder(
              itemCount: contactForms.length,
              itemBuilder: (_, index) {
                return contactForms[index];
              })
          : const Center(child: Text("Tap on + to Add Contact")),
    );
  }

  onSave() {
    bool allValid = true;

    contactForms
        .forEach((element) => allValid = (allValid && element.isValidated()));

    if (allValid) {
      List<String?> names =
          contactForms.map((e) => e.contactModel.name).toList();
      debugPrint("$names");
    } else {
      debugPrint("Form is Not Valid");
    }
  }

  //Delete specific form
  onRemove(ContactModel contact) {
    setState(() {
      int index = contactForms
          .indexWhere((element) => element.contactModel.id == contact.id);

      if (contactForms != null) contactForms.removeAt(index);
    });
  }

  onAdd() {
    setState(() {
      ContactModel contactModel = ContactModel(id: contactForms.length);
      contactForms.add(ContactFormItemWidget(
        index: contactForms.length,
        contactModel: contactModel,
        onRemove: () => onRemove(contactModel),
      ));
    });
  }
}
