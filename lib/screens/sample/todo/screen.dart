import 'package:flutter/material.dart';
import 'package:flutter_starter_project/controllers/sample/todo.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      color: const Color.fromARGB(255, 44, 62, 80),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
                color:
                    TodoController.instance.todoSelect.value?.completed ?? false
                        ? const Color.fromARGB(255, 26, 188, 156)
                        : const Color.fromARGB(255, 241, 196, 15),
                borderRadius: BorderRadius.circular(20)),
            width: double.infinity,
            // Just Showing have diffrent userId
            height: 50 +
                30 *
                    (TodoController.instance.todoSelect.value?.userId
                            .toDouble() ??
                        1),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        TodoController.instance.todoSelect.value?.id
                                .toString() ??
                            '',
                        style: const TextStyle(color: Colors.black)),
                    const SizedBox(height: 5),
                    Center(
                      child: Text(
                        TodoController.instance.todoSelect.value?.title ??
                            'No item selected',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                )),
          )),
    )));
  }
}
