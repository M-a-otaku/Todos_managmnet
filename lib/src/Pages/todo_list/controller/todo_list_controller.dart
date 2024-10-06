import 'package:get/get.dart';
import '../../../infrastructure/routes/route_names.dart';
import '../models/todo_item_model.dart';

class TodoListController extends GetxController {
  int idCount = 1;
  RxString title = 'Todos'.obs;
  RxList<TodoItemModel> todos = RxList([]);

  Future<void> editTodo(int id) async {
    int index = todos.indexWhere((element) => element.id == id);

    Map<String, String> args = {
      'title': todos[index].title,
      'description': todos[index].description,
    };

    final result = await Get.toNamed(RouteNames.editTodo, arguments: args);

    if (result != null) {
      TodoItemModel newTodo = todos[index].copyWith(
        title: result['title'],
        description: result['description'],
      );
      todos[index] = newTodo;
    }
  }

  Future<void> addTodo() async {
    final result = await Get.toNamed(RouteNames.addTodo);
    todos.add(
      TodoItemModel(
          id: idCount, title: result[0], description: result[1], isDone: false),
    );
    ++idCount;
  }

  void onTodoDone(int id, bool newValue) {
    int index = todos.indexWhere((element) => element.id == id);
    TodoItemModel newTodo = todos[index].copyWith(isDone: newValue);
    todos[index] = newTodo;
  }

  void onRemove(int id) {
    todos.removeWhere((element) => element.id == id);
  }
}
