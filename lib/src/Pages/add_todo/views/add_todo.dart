import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_todo_controller.dart';

class AddTodo extends GetView<AddTodoController> {
  const AddTodo({super.key});

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
        title: const Text('Add TODO'),
        centerTitle: true,
        foregroundColor: Colors.cyan,
        titleTextStyle: const TextStyle(fontSize: 18, color: Colors.white),
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(double.infinity)),
        backgroundColor: Colors.blueAccent,
      );

  Widget _fab() {
    return FloatingActionButton(
      mouseCursor: SystemMouseCursors.progress,
      onPressed: controller.submit,
      hoverColor: Colors.white,
      child: const Icon(
        Icons.check,
        color: Colors.black,
      ),
    );
  }

  Widget _descriptionField() {
    return TextFormField(
      controller: controller.descriptionController,
      validator: controller.validator,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.lightBlueAccent)),
        errorStyle: const TextStyle(color: Colors.lightBlue),
        border: const OutlineInputBorder(),
        labelText: 'Description',
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _titleField(),
            const SizedBox(height: 18),
            _descriptionField(),
          ],
        ),
      ),
    );
  }

  Widget _titleField() {
    return TextFormField(
      controller: controller.titleController,
      validator: controller.validator,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.lightBlueAccent)),
        errorStyle: const TextStyle(color: Colors.lightBlue),
        border: const OutlineInputBorder(),
        labelText: 'Title',
      ),
    );
  }
}
