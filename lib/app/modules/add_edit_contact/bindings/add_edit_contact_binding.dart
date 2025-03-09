import 'package:get/get.dart';

import '../controllers/add_edit_contact_controller.dart';

class AddEditContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditContactController>(
      () => AddEditContactController(),
    );
  }
}
