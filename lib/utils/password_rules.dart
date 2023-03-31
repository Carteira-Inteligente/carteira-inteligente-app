class PasswordRules {
  bool checkUpperCase(String str) {
    return str.codeUnits.any((ch) => ch >= 97 && ch <= 122);
  }

  bool checkLowerCase(String str) {
    return str.codeUnits.any((ch) => ch >= 65 && ch <= 90);
  }

  bool checkSpecialCharacters(String str) {
    RegExp regex = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
    return regex.hasMatch(str);
  }

  bool checkNumber(String str) {
    RegExp regex = RegExp(r'\d');
    return regex.hasMatch(str);
  }

  bool checkLength(String str) {
    return str.length >= 8;
  }

  bool passwordMustHave(String password) {
    bool hasLowerCase = checkLowerCase(password);
    bool hasUpperCase = checkUpperCase(password);
    bool hasSpecialCharacters = checkSpecialCharacters(password);
    bool hasNumber = checkNumber(password);
    bool hasLength = checkLength(password);

    return hasLowerCase &&
        hasUpperCase &&
        hasSpecialCharacters &&
        hasNumber &&
        hasLength;
  }
}
