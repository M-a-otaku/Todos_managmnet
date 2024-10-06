import 'package:get/get.dart';
import 'route_path.dart';
import '../../pages/edit_todo/views/edit_todo.dart';
import '../../pages/edit_todo/common/edit_todo_bindings.dart';
import '../../pages/add_todo/commons/add_todo_bindings.dart';
import '../../pages/add_todo/views/add_todo.dart';
import '../../pages/todo_list/common/todo_binding.dart';
import '../../pages/todo_list/view/todo_list_page.dart';

class RoutePages {
  static List<GetPage> pages = [
    GetPage(
      name: RoutePath.todo,
      page: () => const TodoListPage(),
      binding: TodoBinding(),
      children: [
        GetPage(
          name: RoutePath.addTodo,
          page: () => const AddTodo(),
          binding: AddTodoBindings(),
        ),
        GetPage(
          name: RoutePath.editTodo,
          page: () => const EditTodo(),
          binding: EditTodoBindings(),
        ),
      ],
    ),
  ];
}
