import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/firebase_humanize_error_code.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isPasswordObscure = true.obs;
  var isConfirmPasswordObscure = true.obs;

  final auth = FirebaseAuth.instance;
  final CollectionReference users = FirebaseFirestore.instance.collection(
    'users',
  );

  var isLoading = false.obs;
  String? errorMessage;

  void onChangeVisibilityPassword() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  void onChangeVisibilityConfirmPassword() {
    isConfirmPasswordObscure.value = !isConfirmPasswordObscure.value;
  }

  Future<void> onRegister() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;
    errorMessage = null;

    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (result.user != null) {
        await users.doc(result.user!.uid).set({
          "name": nameController.text.trim(),
        });
      }

      await auth.signOut();

      Get.defaultDialog(
        title: "Success",
        middleText: "Registration successful!",
        onConfirm: () {
          Get.back();
          Get.back();
        },
      );
    } on FirebaseAuthException catch (e) {
      errorMessage =
          firebaseHumanizeErrorCode(e.code) ?? "Unexpected Error Occurred";
    } catch (e) {
      errorMessage = e.toString();
    }

    if (errorMessage != null) {
      Get.defaultDialog(
        title: "Error",
        middleText: errorMessage!,
        onConfirm: () {
          Get.back();
        },
      );
    }

    isLoading.value = false;
  }
}
