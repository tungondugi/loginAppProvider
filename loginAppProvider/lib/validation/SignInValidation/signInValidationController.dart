import 'package:flutter/foundation.dart';
import 'package:loginAppProvider/validation/SignInValidation/signInValidationModel.dart';

class SignInController with ChangeNotifier {
  /// [setters] -> only for the local classes and methods.
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);
  bool _obscurePassword = true;

  /// [getters] -> will be used by other non_local class or methods.
  ValidationItem get email => _email;
  ValidationItem get password => _password;
  bool get obscurePassword => _obscurePassword;

  bool get isValid {
    if (_email.value != null && _password.value != null) {
      return true;
    } else {
      return false;
    }
  }

  /// [For email Validation]
  void isEmail(String email) {
    // For validating email address
    // Returns whether the regular expression has a match in the string [input].
    // Email address validation will be implemented more concretely on the server-side.
    bool emailValid = RegExp(
            // Regular Expression that matches an email address.
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (emailValid) {
      // If true, then set the email address
      _email = ValidationItem(email, null);
    } else {
      // if not true, show error message.
      _email = ValidationItem(null, "Use correct email address!");
    }
    notifyListeners();
  }

  /// [For password Validation]
  void isPassword(String value) {
    // Password validation will be implemented more concretely on the server-side.
    if (value == null) {
      _password = ValidationItem(null, "Password should not be empty");
    } else {
      _password = ValidationItem(value, null);
    }
    notifyListeners();
  }

  /// [For Obscuring password]

  void togglePassword() {
    // Toggling between true and false to obscure the password(or not).
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void submitData() {
    print("Email:${_email.value}\nPassword:${_password.value}");
  }
}
