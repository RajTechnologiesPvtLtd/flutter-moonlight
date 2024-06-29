import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

import '../utils/utils.dart';

// Widget customSelect(ctr) {
//   return DropdownButtonFormField<String>(
//       validator: (value) {
//         return (value == null || value.isEmpty) ? 'Please Enter Type' : null;
//       },
//       items: types.map((value) {
//         return DropdownMenuItem<String>(
//           value: value['id'].toString(), //value,
//           child: Text(value['name']),
//         );
//       }).toList(),
//       onChanged: (value) {
//         setState(() {
//           _typeIdCtr.text = value!;
//         });
//       },
//       decoration: const InputDecoration(
//         labelText: "Select Type",
//       ));
// }

InputDecoration inputDecoration(String labelText, IconData iconData,
    {String? prefix, String? helperText, String? hintText}) {
  return InputDecoration(
    // contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    // labelStyle: TextStyle(color: Colors.grey),
    // fillColor: Colors.grey.shade200,
    // filled: true,
    prefixText: prefix,
    // prefixIcon: Icon(
    //   iconData,
    //   size: 20,
    // ),
    prefixIconConstraints: const BoxConstraints(minWidth: 60),
    // enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(30),
    //     borderSide: BorderSide(color: Colors.black)),
    // focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(30),
    //     borderSide: BorderSide(color: Colors.black)),
    // errorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(30),
    //     borderSide: BorderSide(color: Colors.black)),
    // border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(30),
    //     borderSide: BorderSide(color: Colors.black)),
  );
}

class MLTextField extends StatelessWidget {
  String labelText;
  String? hintText;
  TextEditingController controller = TextEditingController();
  MLTextField(
      {required this.labelText,
      this.hintText,
      required this.controller,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator: (value) {
      //   return customTextValidator(value);
      // },
      controller: controller,
      // decoration: inputDecoration(labelText, Icons.abc),
      decoration: InputDecoration(hintText: labelText),
    );
  }
}

class MLNumberField extends StatelessWidget {
  final String labelText;
  dynamic validator;
  final String? hintText;
  bool readOnly;
  Function(String)? onChanged = (value) => int.parse(value);

  TextInputType? keyboardType;
  TextEditingController controller = TextEditingController();
  MLNumberField({
    required this.labelText,
    required this.controller,
    this.validator,
    this.hintText,
    this.onChanged,
    this.readOnly = false,
    this.keyboardType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: inputDecoration(labelText, Icons.abc),
      validator: validator,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
      ],
      onChanged: onChanged,
      // onChanged: (value) => int.parse(value),
      readOnly: readOnly,
    );
  }
}

class MLPasswordField extends StatefulWidget {
  String labelText;
  String? hintText;
  bool passwordVisible;
  TextEditingController controller = TextEditingController();
  MLPasswordField(
      {required this.labelText,
      this.hintText,
      this.passwordVisible = true,
      required this.controller,
      Key? key})
      : super(key: key);

  @override
  State<MLPasswordField> createState() => _MLPasswordFieldState();
}

class _MLPasswordFieldState extends State<MLPasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.passwordVisible,
      validator: (value) {
        return customTextValidator(value);
      },
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              widget.passwordVisible = !widget.passwordVisible;
            });
          },
          icon: Icon(
              widget.passwordVisible ? Icons.visibility : Icons.visibility_off),
        ),
        labelText: widget.labelText,
      ),
    );
  }
}

class MLSelectField extends StatelessWidget {
  final String labelText;
  dynamic validator;
  List<DropdownMenuItem<String>>? items;
  final String? hintText;
  final String? value;
  Function? onChanged;

  TextEditingController controller = TextEditingController();
  MLSelectField({
    required this.labelText,
    required this.controller,
    required this.items,
    this.validator,
    this.hintText,
    this.value,
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: validator,
      items: items,
      value: value,
      onChanged: (value) {
        // controller.text = value!;
        // onChanged!(value);
        controller.text = value ?? ''; // Handle null value
        onChanged?.call(value); // Use ?. and call() to handle null onChanged
      },
      // decoration: inputDecoration(labelText, Icons.abc),
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}

class MLDateTimeField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final String dateFormat;
  final TextEditingController controller;
  final Function(String)? onChanged;

  const MLDateTimeField({
    required this.labelText,
    required this.controller,
    this.hintText,
    this.onChanged,
    this.dateFormat = "yyyy-MM-dd HH:mm:ss",
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: inputDecoration(labelText, Icons.abc),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDateTime = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );

        if (pickedDateTime != null) {
          TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );

          if (pickedTime != null) {
            pickedDateTime = DateTime(
              pickedDateTime.year,
              pickedDateTime.month,
              pickedDateTime.day,
              pickedTime.hour,
              pickedTime.minute,
              pickedDateTime.second,
            );

            String formattedDate =
                DateFormat(dateFormat).format(pickedDateTime);
            controller.text = formattedDate;

            onChanged?.call(formattedDate);
          }
        }
      },
    );
  }
}
