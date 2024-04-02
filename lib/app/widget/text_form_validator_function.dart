abstract class Validator{

  static String? emailValidator(String? value) {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value ?? "");
    if (value?.isEmpty == true) {
      return "Email must have value";
    }


    if (value?.contains("@") == false) {
      return "invalid email '@' is missing";
    }
    if (value?.split("@").length != 2) {
      return "invalid email";
    }
    if (value?.contains(".") == false) {
      return " invalid email dot is missing";

    }
    if(!emailValid){
      return "invalid email";
    }
    else {
      return null;
    }
  }
  static String? passwordValidator(String? value) {
    if (value?.isEmpty == true) {
      return "Password must have value";
    } else if ((value?.length ?? 0) <= 4) {
      return "Password to short ";
    } else {
      return null;
    }
  }
  static String? userNameValidator(String? value) {
    if (value?.isEmpty == true) {
      return "Name must have value";
    } else if ((value?.length ?? 0) <= 4) {
      return "Name to short ";
    } else {
      return null;
    }
  }

}






