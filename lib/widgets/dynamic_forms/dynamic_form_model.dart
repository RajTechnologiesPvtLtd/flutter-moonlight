import 'package:flutter/material.dart';

enum DynamicFormFieldType {
  text,
  number,
  dropdown,
  date,
  time,
  datetime,
  checkbox
}

enum DynamicFormType { view, dialog, bottomSheet }

class DynamicFormField {
  final String key;
  final String label;
  final String? value;
  final DynamicFormFieldType type;
  final FormFieldValidator? validator;
  final List<DynamicFormFieldOptions>? options;

  DynamicFormField({
    required this.key,
    required this.label,
    required this.type,
    this.validator,
    this.value,
    this.options,
  });

  factory DynamicFormField.fromJson(Map<String, dynamic> json) {
    return DynamicFormField(
      key: json['key'],
      label: json['label'],
      value: json['value'],
      type: DynamicFormFieldType.values
          .firstWhere((e) => e.toString() == 'TaskStatus.${json['type']}'),
      options: json['options'] != null
          ? List<DynamicFormFieldOptions>.from(json['options'])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'label': label,
      'value': value,
      'type': type.toString().split('.').last,
      'options': options!.map((e) => e.toJson()).toList(),
    };
  }
}

class DynamicFormFieldOptions {
  final String label;
  final String? value;
  DynamicFormFieldOptions({
    required this.label,
    this.value,
  });

  factory DynamicFormFieldOptions.fromJson(Map<String, dynamic> json) {
    return DynamicFormFieldOptions(
      label: json['label'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'value': value,
    };
  }
}
