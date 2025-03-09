import 'package:contact_app/app/utils/validators.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/password_setting_controller.dart';

class PasswordSettingView extends GetView<PasswordSettingController> {
  const PasswordSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Password Setting'), centerTitle: true),
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
                          Obx(
                            () => TextFormField(
                              controller: controller.oldPasswordController,
                              validator: onPasswordValidation,
                              obscureText:
                                  controller.isOldPasswordObscure.value,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Old Password",
                                suffixIcon: IconButton(
                                  onPressed:
                                      controller.onChangeVisibilitOldPassword,
                                  icon: Icon(
                                    controller.isOldPasswordObscure.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Obx(
                            () => TextFormField(
                              controller: controller.newPasswordController,
                              validator: onPasswordValidation,
                              obscureText:
                                  controller.isNewPasswordObscure.value,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "New Password",
                                suffixIcon: IconButton(
                                  onPressed:
                                      controller.onChangeVisibilitNewPassword,
                                  icon: Icon(
                                    controller.isNewPasswordObscure.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Obx(
                            () => TextFormField(
                              controller:
                                  controller.newConfirmPasswordController,
                              validator: (value) {
                                return onConfirmPasswordValidation(
                                  value,
                                  controller.newPasswordController.text,
                                );
                              },
                              obscureText:
                                  controller.isNewConfirmPasswordObscure.value,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Confirm New Password",
                                suffixIcon: IconButton(
                                  onPressed:
                                      controller
                                          .onChangeVisibilitNewConfirmPassword,
                                  icon: Icon(
                                    controller.isNewConfirmPasswordObscure.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          FilledButton(
                            onPressed: controller.onChangePassword,
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
