import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class AccountController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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

  Stream<String> getUserData() {
    return firestore
        .collection("users")
        .doc(auth.currentUser?.uid)
        .snapshots()
        .map((snapshot) {
          print(snapshot.data());
          return snapshot.data()?["name"];
        });
  }

  void onLogout() {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Are u sure want to logout?",
      onConfirm: () async {
        await auth.signOut();
        Get.offAllNamed(Routes.LOGIN);
      },
      onCancel: () {
        Get.back();
      },
    );
  }
}
