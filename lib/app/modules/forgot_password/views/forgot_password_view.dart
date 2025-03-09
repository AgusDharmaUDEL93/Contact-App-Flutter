import 'package:contact_app/app/utils/validators.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password'), centerTitle: true),
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
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: onEmailValidation,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Email",
                            ),
                          ),
                          SizedBox(height: 40),
                          FilledButton(
                            onPressed: controller.onResetPassword,
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
