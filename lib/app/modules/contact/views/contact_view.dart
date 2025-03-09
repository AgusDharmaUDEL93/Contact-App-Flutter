import 'package:contact_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Contact'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.ADD_EDIT_CONTACT, parameters: {"id": ""});
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(() {
          if (controller.contacts.isEmpty) {
            return const Center(child: Text("No contacts available."));
          }

          return ListView.builder(
            itemCount: controller.contacts.length,
            itemBuilder: (context, index) {
              final contact = controller.contacts[index];
              return ListTile(
                title: Text(contact.name ?? "No Name"),
                subtitle: Text(contact.phone ?? "No Phone"),
                onTap: () {
                  Get.toNamed(
                    Routes.ADD_EDIT_CONTACT,
                    parameters: {"id": contact.id ?? ""},
                  );
                },
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => controller.deleteContact(contact.id!),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
