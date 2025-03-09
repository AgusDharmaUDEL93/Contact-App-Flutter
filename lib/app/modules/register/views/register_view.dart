import 'package:contact_app/app/utils/validators.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true),
      body: Obx(
        () =>
            controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: controller.formKey,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: Get.width),
                            Text(
                              "Register",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            SizedBox(height: 40),
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
                            SizedBox(height: 16),
                            Obx(
                              () => TextFormField(
                                controller: controller.passwordController,
                                validator: onPasswordValidation,
                                obscureText: controller.isPasswordObscure.value,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Password",
                                  suffixIcon: IconButton(
                                    onPressed:
                                        controller.onChangeVisibilityPassword,
                                    icon: Icon(
                                      controller.isPasswordObscure.value
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
                                    controller.confirmPasswordController,
                                validator: (value) {
                                  return onConfirmPasswordValidation(
                                    value,
                                    controller.passwordController.text,
                                  );
                                },
                                obscureText:
                                    controller.isConfirmPasswordObscure.value,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Confirm Password",
                                  suffixIcon: IconButton(
                                    onPressed:
                                        controller
                                            .onChangeVisibilityConfirmPassword,
                                    icon: Icon(
                                      controller.isConfirmPasswordObscure.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 40),
                            FilledButton(
                              onPressed: controller.onRegister,
                              child: SizedBox(
                                width: Get.width,
                                child: Center(child: Text("Register")),
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account ?"),
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text("Login"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
      ),
    );
  }
}
