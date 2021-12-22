class Validation {
  String? validateEmail([String? v]) {
    final regExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

    return v != null && regExp.hasMatch(v) ? null : 'Enter valid Email';
  }

  String? validateName([String? v]) {
    final regExp = RegExp(r'^[a-zA-Z]{4,}$');

    return v != null && regExp.hasMatch(v) ? null : 'Enter valid name (minimum 4 characters)';
  }

  String? validatePhone([String? v]) {
    final regExp = RegExp(r'^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$');

    return v != null && regExp.hasMatch(v) ? null : 'Valid format XXX-XXX-XXXX';
  }

  String? validateDisabled([String? v]) {
    final regExp = RegExp(r'^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$');

    return v != null && regExp.hasMatch(v) ? null : 'Valid format XXX-XXX-XXXX';
  }

  String? validatePosition([int? v]) {
    return v != null ? null : 'Select position';
  }
}
