extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }
  bool get isValidName {
    final nameRegExp = RegExp(r"^[a-zA-Z]{4}");
    return nameRegExp.hasMatch(this);
  }
  bool get isValidPhone {
    final nameRegExp = RegExp(r"^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$");
    return nameRegExp.hasMatch(this);
  }
}