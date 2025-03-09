import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/contact.dart';
import '../../../utils/firebase_humanize_error_code.dart';

class AddEditContactController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var contact = Contact().obs;
  var isEditing = false.obs;
  var title = "Create Contact".obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String? errorMessage;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    String? contactId = Get.parameters["id"];

    if (contactId != null && contactId.isNotEmpty) {
      isEditing.value = true;
      title.value = "Edit Contact";
      fetchContact(contactId);
    }
  }

  void fetchContact(String contactId) async {
    final user = _auth.currentUser;
    if (user == null) return;

    isLoading.value = true;

    final doc =
        await _firestore
            .collection("users")
            .doc(user.uid)
            .collection("contacts")
            .doc(contactId)
            .get();

    if (doc.exists) {
      contact.value = Contact.fromJson(doc.data()!);
      contact.value.id = doc.id;
      nameController.text = contact.value.name ?? "";
      phoneController.text = contact.value.phone ?? "";
    }

    isLoading.value = false;
  }

  void saveContact() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final user = _auth.currentUser;
    if (user == null) return;
    isLoading.value = true;
    try {
      if (isEditing.value) {
        await _firestore
            .collection("users")
            .doc(user.uid)
            .collection("contacts")
            .doc(contact.value.id)
            .update({
              "name": nameController.text,
              "phone": phoneController.text,
            });
      } else {
        await _firestore
            .collection("users")
            .doc(user.uid)
            .collection("contacts")
            .add({"name": nameController.text, "phone": phoneController.text});
      }
    } on FirebaseAuthException catch (e) {
      errorMessage =
          firebaseHumanizeErrorCode(e.code) ?? "Unexpected Error Occured";
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading.value = false;
    Get.defaultDialog(
      title: errorMessage == null ? "Succes" : "Error",
      middleText:
          errorMessage == null
              ? isEditing.value
                  ? "Success to update contact"
                  : "Success to create contact"
              : "$errorMessage",
      onConfirm: () {
        Get.back();
        Get.back();
      },
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
