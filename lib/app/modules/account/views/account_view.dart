import 'package:contact_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Account'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: StreamBuilder<String>(
            stream: controller.getUserData(),
            builder: (context, snapshot) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    snapshot.data ?? "-",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    controller.auth.currentUser?.email ?? "-",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.ACCOUNT_SETTING);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Expanded(child: Text("Account Setting")),
                          Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.black12),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.PASSWORD_SETTING);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Expanded(child: Text("Password Setting")),
                          Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.black12),
                  SizedBox(height: 40),
                  FilledButton(
                    onPressed: controller.onLogout,
                    child: SizedBox(
                      width: Get.width,
                      child: Center(child: Text("Logout")),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
