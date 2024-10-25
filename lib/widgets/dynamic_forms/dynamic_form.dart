import 'dart:developer';

import 'package:flutter/material.dart';

import '../widgets.dart';
import 'dynamic_form_model.dart';

// ignore: must_be_immutable
class DynamicForm extends StatefulWidget {
  int? recordId;
  String? title;
  Map<String, dynamic>? record;
  final formKey = GlobalKey<FormState>();
  final List<DynamicFormField> fields;
  final DynamicFormType type;
  final Function(Map<String, dynamic>)? onSubmit;
  DynamicForm({
    super.key,
    this.recordId,
    this.record,
    this.title,
    required this.fields,
    this.type = DynamicFormType.view,
    GlobalKey<FormState>? formKey,
    this.onSubmit,
  });

  Map<String, String?> getValues() {
    return fields
        .asMap()
        .map((index, field) => MapEntry(field.key, field.value));
  }

  @override
  State<DynamicForm> createState() => _DynamicFormState();

  static buildSubmitButton(GlobalKey<FormState> formKey) {}
}

class _DynamicFormState extends State<DynamicForm> {
  bool isLoading = true;
  Map<String, TextEditingController> controllers = {};

  @override
  void initState() {
    super.initState();
    initializeControllers();
    isLoading = false;
  }

  initializeControllers() {
    for (var field in widget.fields) {
      controllers[field.key] = TextEditingController();
      if (widget.record != null) {
        controllers[field.key]!.text = widget.record![field.key].toString();
      }
    }
  }

  disposeControllers() {
    for (var field in widget.fields) {
      controllers[field.key]?.dispose();
    }
  }

  resetForm() {
    for (var field in widget.fields) {
      controllers[field.key]?.text = '';
    }
  }

  submitAction() async {
    if (widget.formKey.currentState!.validate()) {
      widget.formKey.currentState!.save();
      final values =
          controllers.map((key, controller) => MapEntry(key, controller.text));
      if (widget.onSubmit != null) {
        widget.onSubmit!(values);
        Navigator.of(context).pop();
      }
    }
  }

  closeAction() async {
    disposeControllers();
    Navigator.of(context).pop();
  }

  optionAction() async {
    inspect(widget.formKey.currentState!.validate());
  }

  Widget buildAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        (widget.recordId) == null
            ? mlTextButton(
                'Delete',
                optionAction,
              )
            : Container(),
        Row(
          children: [
            mlButton(
              'Cancel',
              closeAction,
            ),
            sizedBoxByWidth(10),
            mlButton(
              widget.recordId == null ? 'Save' : 'Update',
              submitAction,
            ),
          ],
        )
      ],
    );
  }

  Widget buildField(DynamicFormField field) {
    switch (field.type) {
      case DynamicFormFieldType.text:
        return MLTextField(
          controller: controllers[field.key]!,
          labelText: field.label,
        );
      case DynamicFormFieldType.number:
        return MLNumberField(
          controller: controllers[field.key]!,
          labelText: field.label,
        );
      case DynamicFormFieldType.date:
        return MLDateField(
          controller: controllers[field.key]!,
          labelText: field.label,
        );
      case DynamicFormFieldType.datetime:
        return MLDateTimeField(
          controller: controllers[field.key]!,
          labelText: field.label,
        );
      // case DynamicFormFieldType.dropdown:
      //   return MLSelectField(
      //     labelText: field.label,
      //     // controller: controllers[field['name']]!,
      //     items: field.options!.map<DropdownMenuItem<String>>((value) {
      //       return DropdownMenuItem<String>(
      //         value: value['id'].toString(),
      //         child: Text(value['name']),
      //       );
      //     }).toList(),
      //   );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case DynamicFormType.dialog:
        return Form(
          key: widget.formKey,
          child: AlertDialog.adaptive(
            title: (widget.title != null && widget.title!.isNotEmpty)
                ? Text(widget.title ?? '')
                : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            scrollable: true,
            actions: [
              Visibility(
                visible: (widget.recordId) == null ? false : true,
                child: mlTextButton(
                  'Delete',
                  optionAction,
                ),
              ),
              mlTextButton(
                'Cancel',
                closeAction,
              ),
              mlTextButton(
                widget.recordId == null ? 'Save' : 'Update',
                submitAction,
              )
            ],
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (widget.fields.isNotEmpty)
                    ...widget.fields.map((field) => buildField(field)).toList(),
                  // buildAction(),
                ],
              ),
            ),
          ),
        );
      default:
        return Form(
          key: widget.formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: widget.fields.length,
                  itemBuilder: (context, index) {
                    return buildField(widget.fields[index]);
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
                ),
              ),
              buildAction()
            ],
          ),
        );
    }
  }
}
