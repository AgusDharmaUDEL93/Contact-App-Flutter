import 'package:contact_app/app/routes/app_pages.dart';
import 'package:contact_app/app/utils/validators.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              "Login",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            SizedBox(height: 40),
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
                            SizedBox(height: 4),
                            TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.FORGOT_PASSWORD);
                              },
                              child: SizedBox(
                                width: Get.width,
                                child: Text("Forgot Password"),
                              ),
                              style: ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                  EdgeInsets.zero,
                                ),
                              ),
                            ),
                            SizedBox(height: 40),
                            FilledButton(
                              onPressed: controller.onLogin,
                              child: SizedBox(
                                width: Get.width,
                                child: Center(child: Text("Login")),
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account ?"),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.REGISTER);
                                  },
                                  child: Text("Register"),
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
