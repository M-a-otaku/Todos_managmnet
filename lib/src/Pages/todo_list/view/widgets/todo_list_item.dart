import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/todo_list_controller.dart';
import '../../models/todo_item_model.dart';

class TodoListItem extends GetView<TodoListController> {
  const TodoListItem({super.key, required this.todo});

  final TodoItemModel todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          _checkBox(),
          const SizedBox(width: 17),
          _titleDescription(),
          const Spacer(),
          _deleteButton(),
          _editButton(),
        ],
      ),
    );
  }

  Widget _deleteButton() {
    return IconButton(
      mouseCursor:
          todo.isDone ? SystemMouseCursors.forbidden : SystemMouseCursors.help,
      onPressed: todo.isDone ? null : () => controller.onRemove(todo.id),
      icon: const Icon(Icons.delete),
      isSelected: !todo.isDone,
    );
  }

  Widget _checkBox() {
    return Checkbox(
      // چون باحال بود  گزاشتمش
      mouseCursor: SystemMouseCursors.none,
      activeColor: Colors.grey,
      value: todo.isDone,
      onChanged: (value) {
        controller.onTodoDone(todo.id, value!);
      },
    );
  }

  Widget _titleDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          todo.title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        Text(todo.description,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400))
      ],
    );
  }

  Widget _editButton() {
    return IconButton(
      onPressed: () => controller.editTodo(todo.id),
      icon: const Icon(Icons.edit),
    );
  }
}
