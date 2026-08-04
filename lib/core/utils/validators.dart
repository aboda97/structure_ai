// ============================================================
// Form validation helpers.
//
// Each method follows the Flutter validator contract: return `null` when
// the value is OK, or an error message (String) when it isn't. They plug
// directly into the `validator:` parameter of a TextFormField:
//
//     TextFormField(validator: Validators.email)
//
// This keeps validation logic in ONE place, reused by every screen.
// ============================================================

abstract final class Validators {
  const Validators._();

  /// Fails when the field is empty/blank (generic "required" check).
  static String? required(
    String? value, {
    String message = 'This field is required',
  }) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }

    return null;
  }

  /// Fails when the value is not a valid email address.
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    // Simple but practical email pattern: name@domain.tld.
    final regex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!regex.hasMatch(value.trim())) {
      return 'Invalid email';
    }

    return null;
  }

  /// Fails when the password is missing or shorter than 8 characters.
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Minimum 8 characters';
    }

    return null;
  }

  /// Fails when the phone number isn't 10-15 digits.
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

  /// Fails when [value] doesn't match the [password] entered earlier.
  static String? confirmPassword(String? value, String password) {
    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }
}
