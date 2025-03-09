import 'package:get/get.dart';

String? onEmailValidation(String? value) {
  if (onNotEmptyValidation(value, "Email") != null) {
    return onNotEmptyValidation(value, "Email");
  }

  if (!GetUtils.isEmail(value!)) {
    return "Please input the correct email";
  }
  return null;
}

String? onPhoneValidation(String? value) {
  if (onNotEmptyValidation(value, "Phone") != null) {
    return onNotEmptyValidation(value, "Phone");
  }

  if (!GetUtils.isPhoneNumber(value!)) {
    return "Please input the correct phone number";
  }
  return null;
}

String? onPasswordValidation(String? value) {
  if (onNotEmptyValidation(value, "Password") != null) {
    return onNotEmptyValidation(value, "Password");
  }

  if (value!.length < 8) {
    return "Password can't be less than 8 character";
  }
  return null;
}

String? onNotEmptyValidation(String? value, String label) {
  if (value == null || value.isEmpty) {
    return "$label can't be empty";
  }
  return null;
}

String? onConfirmPasswordValidation(String? value, String password) {
  if (onNotEmptyValidation(value, "Password") != null) {
    return onNotEmptyValidation(value, "Password");
  }

  if (value!.length < 8) {
    return "Password can't be less than 8 character";
  }

  if (value! != password) {
    return "Password doesn't match";
  }

  return null;
}
