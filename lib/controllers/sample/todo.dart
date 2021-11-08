import 'dart:convert';

import 'package:flutter_starter_project/providers/info/http_status_code.dart';
import 'package:get/get.dart';

import '../../models/sample/todo.dart';
import '../../providers/sample/todo.dart';

class TodoController extends GetxController {
  static _() => _instance = Get.put(TodoController());
  static TodoController? _instance;
  static TodoController get instance => _instance ?? _();

  RxList<TodoModel> todos = <TodoModel>[].obs;
  Rx<TodoModel?> todoSelect = Rx(null);

  Future<List<TodoModel>> getTodos() async {
    todos = <TodoModel>[].obs;

    // Call Provider
    var res = await TodoProvider.getAll();

    // If request is success get data
    if (res.statusCode == HttpStatusCode.ok) {
      Iterable jsonMap = json.decode(res.body);
      todos = jsonMap.map((model) => TodoModel.fromJson(model)).toList().obs;
      update();
      print('item count loaded: ' + todos.length.toString());
    }

    return todos;
  }

  Future<TodoModel> getTodo(int id) async {
    TodoModel todo = TodoModel();

    // Call Provider
    var res = await TodoProvider.getAll();

    // If request is success get data
    if (res.statusCode == HttpStatusCode.ok) {
      Map<String, dynamic> jsonMap = json.decode(res.body);
      todoSelect = (todo = TodoModel.fromJson(jsonMap)).obs;
      update();
    }

    return todo;
  }
}
