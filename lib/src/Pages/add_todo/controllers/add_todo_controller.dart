import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddTodoController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? validator(String? input) {
    if (input != null) {
      if (input.isEmpty) return 'required';
    }
    return null;
  }

  void submit() async {
    if (formKey.currentState?.validate() ?? false) {
      List<String> todo = [titleController.text, descriptionController.text];
      Get.back<List<String>?>(result: todo);
    }
  }

  @override
  void onClose() {
    super.onClose();
    titleController.dispose();
    descriptionController.dispose();
  }
}
