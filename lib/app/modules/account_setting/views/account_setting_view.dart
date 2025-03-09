import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/validators.dart';
import '../controllers/account_setting_controller.dart';

class AccountSettingView extends GetView<AccountSettingController> {
  const AccountSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account Setting'), centerTitle: true),
      body: Obx(
        () =>
            controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 16),
                          TextFormField(
                            controller: controller.nameController,
                            validator: (value) {
                              return onNotEmptyValidation(value, "Name");
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Name",
                            ),
                          ),
                          SizedBox(height: 40),
                          FilledButton(
                            onPressed: controller.onUpdateAccount,
                            child: SizedBox(
                              width: Get.width,
                              child: Center(child: Text("Update")),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
      ),
    );
  }
}
