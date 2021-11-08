import 'package:flutter_starter_project/screens/sample/todos/screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SampleRouter {
  static const todosRoute = '/todos/';
  static const todoDetailRoute = '/todos/detail';

  static List<GetPage> routes = [
    GetPage(name: todosRoute, page: () => TodosScreen()),
    // GetPage(name: todoDetailRoute, page: () => TodoDetailScreen()),
  ];
}
