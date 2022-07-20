extension StringValidationService on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidUserName {
    final nameRegExp =
        // ignore: unnecessary_new
        new RegExp(r"^[A-Za-z][A-Za-z0-9_]{1,}$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp =
        RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    return passwordRegExp.hasMatch(this);
  }

  bool get isContaindigit {
    final passwordRegExp = RegExp(r"^(?=.*[0-9])");
    return passwordRegExp.hasMatch(this);
  }

  bool get isContainLowercase {
    final passwordRegExp = RegExp(r"^(?=.*[a-z])");
    return passwordRegExp.hasMatch(this);
  }

  bool get isContainUppercase {
    final passwordRegExp = RegExp(r"^(?=.*[A-Z])");
    return passwordRegExp.hasMatch(this);
  }

  bool get isContainSpecialCharacter {
    final passwordRegExp = RegExp(r"^(?=.*?[#?!@$%^&*-])");
    return passwordRegExp.hasMatch(this);
  }

  bool get isLeastEightCharacter {
    final passwordRegExp = RegExp(r"^(?=.*[A-Z])");
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    // ignore: unnecessary_null_comparison
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
