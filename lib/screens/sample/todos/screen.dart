import 'package:flutter/material.dart';
import 'package:flutter_starter_project/controllers/sample/todo.dart';
import 'package:flutter_starter_project/models/sample/todo.dart';
import 'package:get/get.dart';
import 'components/components.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen() : super();

  @override
  _TodosScreenState createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  // For offline test
  List<TodoModel> todosData = [
    TodoModel(id: 1, userId: 1, title: "Hamidreza", completed: true),
    TodoModel(id: 2, userId: 2, title: "Alireza", completed: false),
    TodoModel(id: 3, userId: 3, title: "Azam", completed: true),
  ];

  @override
  void initState() {
    super.initState();

    TodoController.instance.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color.fromARGB(255, 44, 62, 80),
                child: GetBuilder<TodoController>(
                    init: TodoController.instance,
                    builder: (_c) => TodoController.instance.todos.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: TodoController.instance.todos.length,
                            itemBuilder: (BuildContext buildContext,
                                    int index) =>
                                todo(TodoController.instance.todos[index]))))));
  }
}
