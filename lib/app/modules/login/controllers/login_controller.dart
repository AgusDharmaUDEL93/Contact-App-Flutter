import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/firebase_humanize_error_code.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isPasswordObscure = true.obs;

  var isLoading = false.obs;
  String? errorMessage;

  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onChangeVisibilityPassword() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  void onLogin() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    isLoading.value = true;
    try {
      await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      errorMessage =
          firebaseHumanizeErrorCode(e.code) ?? "Unexpected Error Occured";
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading.value = false;
    Get.defaultDialog(
      title: errorMessage == null ? "Succes" : "Error",
      middleText: errorMessage == null ? "Success to login" : "$errorMessage",
      onConfirm: () {
        Get.offAllNamed(Routes.HOME);
      },
    );
  }
}
