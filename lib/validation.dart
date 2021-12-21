// extension Validation on String {
//   bool get isValidEmail {
//     final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
//
//     return emailRegExp.hasMatch(this);
//   }
//   bool get isValidName {
//     final nameRegExp = RegExp(r'^[a-zA-Z]{4}$');
//
//     return nameRegExp.hasMatch(this);
//   }
//   bool get isValidPhone {
//     final nameRegExp = RegExp(r'^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$');
//
//     return nameRegExp.hasMatch(this);
//   }
// }

class Validation {
  String? validateEmail([String? v]) {
    final regExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

    return v != null && regExp.hasMatch(v) ? null : 'Enter valid Email';
  }

  String? validateName([String? v]) {
    final regExp = RegExp(r'^[a-zA-Z]{4}$');

    return v != null && regExp.hasMatch(v) ? null : 'Enter valid name';
  }

  String? validatePhone([String? v]) {
    final regExp = RegExp(r'^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$');

    return v != null && regExp.hasMatch(v) ? null : 'Enter valid phone';
  }

  String? validateDisabled([String? v]) {
    final regExp = RegExp(r'^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$');

    return v != null && regExp.hasMatch(v) ? null : 'Enter 4 or more symbols';
  }

  String? validatePosition([Object? v]) {
    return v != null ? null : 'Select position';
  }
}
