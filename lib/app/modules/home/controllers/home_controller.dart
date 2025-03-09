import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  var tabIndex = 0.obs;
  var isAuth = false.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    onRefresh();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
    var pages = [Routes.CONTACT, Routes.ACCOUNT];
    Get.toNamed(pages[tabIndex.value], id: 1);
  }

  void onRefresh() {
    if (auth.currentUser == null) {
      isAuth.value = false;
      return;
    }
    isAuth.value = true;
  }
}
