String? customTextValidator(value) {
  return (value == null || value.isEmpty) ? 'Please Enter First Name' : null;
}

String? customEmailValidator(value) {
  return (!value.isEmpty && !RegExp(r'\S+@\S+\.\S+').hasMatch(value))
      ? 'Please enter a valid email address'
      : null;
}
