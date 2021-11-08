import 'package:flutter/material.dart';
import 'package:flutter_starter_project/models/sample/todo.dart';

todo(TodoModel data) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    child: Container(
      decoration: BoxDecoration(
          color: data.completed
              ? const Color.fromARGB(255, 26, 188, 156)
              : const Color.fromARGB(255, 241, 196, 15),
          borderRadius: BorderRadius.circular(20)),
      width: double.infinity,
      // Just Showing have diffrent userId
      height: 50 + 30 * data.userId.toDouble(),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.id.toString(),
                  style: const TextStyle(color: Colors.black)),
              const SizedBox(height: 5),
              Center(
                child: Text(
                  data.title,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          )),
    ));
