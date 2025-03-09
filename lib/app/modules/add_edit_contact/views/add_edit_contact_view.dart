import 'package:contact_app/app/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_edit_contact_controller.dart';

class AddEditContactView extends GetView<AddEditContactController> {
  const AddEditContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.title.value)),
        centerTitle: true,
      ),
      body: Obx(
        () =>
            controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
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
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.phoneController,
                          validator: onPhoneValidation,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Phone",
                          ),
                        ),
                        const SizedBox(height: 20),
                        FilledButton(
                          onPressed: controller.saveContact,
                          child: Obx(
                            () => SizedBox(
                              width: Get.width,
                              child: Center(
                                child: Text(
                                  controller.isEditing.value
                                      ? "Update Contact"
                                      : "Add Contact",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
      ),
    );
  }
}
