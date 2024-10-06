import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditTodoController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final String title = Get.arguments['title'] ?? '';
  final String description = Get.arguments['description'] ?? '';

  EditTodoController() {
    titleController.text = title;
    descriptionController.text = description;
  }

  void onEdit() {
    if (formKey.currentState?.validate() ?? false) {
      Map<String, String> result = {
        'title': titleController.text,
        'description': descriptionController.text,
      };
      Get.back<Map<String, String>>(result: result);
    }
  }

  String? validator(String? input) {
    if (input != null) {
      if (input.isEmpty) return 'required';
    }
    return null;
  }

  @override
  void onClose() {
    super.onClose();
    titleController.dispose();
    descriptionController.dispose();
  }
}
