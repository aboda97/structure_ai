abstract final class Validators {
  const Validators._();

  static String? required(
    String? value, {
    String message = 'This field is required',
  }) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }

    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final regex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!regex.hasMatch(value.trim())) {
      return 'Invalid email';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Minimum 8 characters';
    }

    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone is required';
    }

    final regex = RegExp(r'^[0-9]{10,15}$');

    if (!regex.hasMatch(value)) {
      return 'Invalid phone number';
    }

    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }
}


/*

abstract final class Validators{
  static String? required(
    String? value, {
    String message = 'This field is required',
  }) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
}


}*/