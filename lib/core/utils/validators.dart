// lib/core/utils/validators.dart

String? validateEmail(String? text) {
  if (text == null || text.trim().isEmpty) {
    return 'Please enter your email';
  }
  final bool emailValid = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(text);
  if (!emailValid) {
    return 'Please enter a valid email';
  }
  return null;
}

String? validatePassword(String? text) {
  if (text == null || text.trim().isEmpty) {
    return 'Please enter your password';
  }
  if (text.length < 6) {
    return 'Password should be at least 6 characters';
  }
  return null;
}

String? validateConfirmPassword(String? text, String? password) {
  if (text == null || text.trim().isEmpty) {
    return 'Please confirm your password';
  }
  if (text != password) {
    return 'Passwords do not match';
  }
  return null;
}

String? validateField(String? text, String fieldName) {
  if (text == null || text.trim().isEmpty) {
    return 'Please enter your $fieldName';
  }
  return null;
}
