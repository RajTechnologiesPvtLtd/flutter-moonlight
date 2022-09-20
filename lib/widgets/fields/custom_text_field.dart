import 'package:flutter/material.dart';

import '../../utils/input_decoration.dart';
import '../../utils/validator.dart';

class CustomTextField extends StatelessWidget {
  String labelText;
  String? hintText;
  TextEditingController controller = TextEditingController();
  CustomTextField(
      {required this.labelText,
      this.hintText,
      required this.controller,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return CustomTextValidator(value);
      },
      controller: controller,
      decoration: inputDecoration(labelText, Icons.abc),
    );
  }
}
