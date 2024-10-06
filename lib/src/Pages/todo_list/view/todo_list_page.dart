import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/todo_list_item.dart';
import '../controller/todo_list_controller.dart';

class TodoListPage extends GetView<TodoListController> {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: _fab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _body(),
      bottomNavigationBar: const BottomAppBar(
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        color: Colors.blueAccent,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.import_contacts_sharp,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.ac_unit_sharp,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fab() {
    return FloatingActionButton(
      mouseCursor: SystemMouseCursors.cell,
      backgroundColor: Colors.white,
      shape: const CircleBorder(),
      tooltip: 'Add Todo',
      hoverColor: Colors.deepPurpleAccent,
      onPressed: controller.addTodo,
      child: const Icon(
        Icons.add_box,
        color: Colors.black,
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      foregroundColor: Colors.cyan,
      titleTextStyle: const TextStyle(fontSize: 18, color: Colors.white),
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(double.infinity)),
      backgroundColor: Colors.blueAccent,
      centerTitle: true,
      title: Text(controller.title.value),
    );
  }

  Widget _body() {
    return Obx(
      () => ListView.separated(
        itemCount: controller.todos.length,
        separatorBuilder: (_, __) => const Divider(indent: 15, endIndent: 24),
        itemBuilder: (_, index) => TodoListItem(todo: controller.todos[index]),
      ),
    );
  }
}
