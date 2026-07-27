class Validator {

  static bool isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return password.length >= 8;
  }

  static bool isNameValid(String name) {
    return name.length >= 3;
  }
}