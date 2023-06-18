import 'package:flutter/material.dart';
import '../../utils/validator.dart';

class mlPasswordField extends StatefulWidget {
  String labelText;
  String? hintText;
  bool passwordVisible;
  TextEditingController controller = TextEditingController();
  mlPasswordField(
      {required this.labelText,
      this.hintText,
      this.passwordVisible = true,
      required this.controller,
      Key? key})
      : super(key: key);

  @override
  State<mlPasswordField> createState() => _mlPasswordFieldState();
}

class _mlPasswordFieldState extends State<mlPasswordField> {
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
