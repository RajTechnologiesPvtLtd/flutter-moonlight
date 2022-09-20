String? CustomTextValidator(value) {
  return (value == null || value.isEmpty) ? 'Please Enter First Name' : null;
}

String? CustomEmailValidator(value) {
  return (value == null || value.isEmpty) ? 'Please Enter First Name' : null;
}
