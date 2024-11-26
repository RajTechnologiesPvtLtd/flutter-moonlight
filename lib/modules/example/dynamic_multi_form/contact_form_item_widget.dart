import 'package:flutter/material.dart';
import 'contact_model.dart';

class ContactFormItemWidget extends StatefulWidget {
  ContactFormItemWidget({
    super.key,
    required this.contactModel,
    required this.onRemove,
    this.index,
  });

  final index;
  final ContactModel contactModel;
  final Function onRemove;
  final state = _ContactFormItemWidgetState();

  @override
  State<StatefulWidget> createState() {
    return state;
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool isValidated() => state.validate();
}

class _ContactFormItemWidgetState extends State<ContactFormItemWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Contact - ${widget.index}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.orange),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                //Clear All forms Data
                                widget.contactModel.name = "";
                                widget.contactModel.number = "";
                                widget.contactModel.email = "";
                                widget._nameController.clear();
                                widget._contactController.clear();
                                widget._emailController.clear();
                              });
                            },
                            child: const Text(
                              "Clear",
                              style: TextStyle(color: Colors.blue),
                            )),
                        TextButton(
                            onPressed: () => widget.onRemove(),
                            child: const Text(
                              "Remove",
                              style: TextStyle(color: Colors.blue),
                            )),
                      ],
                    ),
                  ],
                ),
                TextFormField(
                  controller: widget._nameController,
                  // initialValue: widget.contactModel.name,
                  onChanged: (value) => widget.contactModel.name = value,
                  onSaved: (value) => widget.contactModel.name = value,
                  validator: (value) => value!.length > 3 ? null : "Enter Name",
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder(),
                    hintText: "Enter Name",
                    labelText: "Name",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: widget._contactController,
                  onChanged: (value) => widget.contactModel.number = value,
                  onSaved: (value) => widget.contactModel.name = value,
                  validator: (value) =>
                      value!.length > 3 ? null : "Number is Not Valid",
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder(),
                    hintText: "Enter Number",
                    labelText: "Number",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: widget._emailController,
                  onChanged: (value) => widget.contactModel.email = value,
                  onSaved: (value) => widget.contactModel.email = value,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder(),
                    hintText: "Enter Email",
                    labelText: "Email",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validate() {
    //Validate Form Fields
    bool validate = formKey.currentState!.validate();
    if (validate) formKey.currentState!.save();
    return validate;
  }
}
