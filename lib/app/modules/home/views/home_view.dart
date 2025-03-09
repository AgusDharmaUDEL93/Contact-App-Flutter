import 'package:contact_app/app/modules/account/bindings/account_binding.dart';
import 'package:contact_app/app/modules/account/views/account_view.dart';
import 'package:contact_app/app/modules/contact/bindings/contact_binding.dart';
import 'package:contact_app/app/modules/contact/views/contact_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      if (!controller.isAuth.value) {
        Get.offAllNamed(Routes.LOGIN);
        print("here on home");
      }
    });

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.tabIndex.value,
          onDestinationSelected: controller.changeTabIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.contact_page),
              label: "Contact",
            ),
            NavigationDestination(icon: Icon(Icons.people), label: "Profile"),
          ],
        ),
      ),
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: Routes.CONTACT,
        onGenerateRoute: (settings) {
          if (settings.name == Routes.CONTACT) {
            return GetPageRoute(
              routeName: Routes.CONTACT,
              page: () => const ContactView(),
              binding: ContactBinding(),
            );
          }

          if (settings.name == Routes.ACCOUNT) {
            return GetPageRoute(
              routeName: Routes.ACCOUNT,
              page: () => const AccountView(),
              binding: AccountBinding(),
            );
          }
          return null;
        },
      ),
    );
  }
}
