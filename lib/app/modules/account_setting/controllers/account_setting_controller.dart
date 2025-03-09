import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/firebase_humanize_error_code.dart';

class AccountSettingController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  var isLoading = false.obs;
  String? errorMessage;

  final auth = FirebaseAuth.instance;
  final firebase = FirebaseFirestore.instance;

  @override
  void onInit() async {
    super.onInit();
    await getCurrentData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getCurrentData() async {
    isLoading.value = true;
    if (auth.currentUser == null) {
      isLoading.value = false;
      Get.defaultDialog(
        title: "Error",
        middleText: "Can't change the account setting, please login first",
        onConfirm: () {
          Get.back();
          Get.back();
        },
      );
      return;
    }

    await firebase.collection("users").doc(auth.currentUser?.uid).get().then((
      DocumentSnapshot document,
    ) {
      if (document.exists) {
        nameController.text = document["name"];
      } else {
        errorMessage = 'Document does not exist on the database';
      }
    });
    isLoading.value = false;
  }

  void onUpdateAccount() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    try {
      await firebase.collection("users").doc(auth.currentUser?.uid).get().then((
        DocumentSnapshot document,
      ) async {
        if (document.exists) {
          if (document["name"] == nameController.text) {
            return;
          }
          await firebase.collection("users").doc(auth.currentUser?.uid).update({
            "name": nameController.text,
          });
        } else {
          errorMessage = 'Document does not exist on the database';
        }
      });
    } on FirebaseAuthException catch (e) {
      errorMessage =
          firebaseHumanizeErrorCode(e.code) ?? "Unexpected Error Occured";
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading.value = false;

    Get.defaultDialog(
      title: errorMessage == null ? "Success" : "Error",
      middleText:
          errorMessage == null
              ? "Success to update your account"
              : "Failed to add because : $errorMessage",
      onConfirm: () {
        Get.back();
        Get.back();
      },
    );
  }
}
