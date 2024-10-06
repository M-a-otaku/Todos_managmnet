import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_todo_controller.dart';

class EditTodo extends GetView<EditTodoController> {
  const EditTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: _fab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  AppBar _appBar() => AppBar(
        title: const Text('Edit Todo'),
        centerTitle: true,
        foregroundColor: Colors.cyan,
        titleTextStyle: const TextStyle(fontSize: 18, color: Colors.white),
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(double.infinity)),
        backgroundColor: Colors.blueAccent,
      );

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _titleTextField(),
            const SizedBox(height: 12),
            _descriptionTextField(),
          ],
        ),
      ),
    );
  }

  Widget _descriptionTextField() {
    return TextFormField(
      controller: controller.descriptionController,
      validator: controller.validator,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.lightBlueAccent)),
        errorStyle: const TextStyle(color: Colors.lightBlue),
        border: const OutlineInputBorder(),
        labelText: 'Edit Description',
      ),
    );
  }

  Widget _fab() {
    return FloatingActionButton(
      mouseCursor: SystemMouseCursors.disappearing,
      hoverColor: Colors.white,
      onPressed: controller.onEdit,
      child: const Icon(
        Icons.check,
        color: Colors.black,
      ),
    );
  }

  Widget _titleTextField() {
    return TextFormField(
      controller: controller.titleController,
      validator: controller.validator,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.lightBlueAccent)),
        errorStyle: const TextStyle(color: Colors.lightBlue),
        border: const OutlineInputBorder(),
        labelText: 'Edit Title',
      ),
    );
  }
}
