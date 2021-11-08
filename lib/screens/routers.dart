import 'package:get/get_navigation/src/routes/get_route.dart';
// Routers
import 'package:flutter_starter_project/screens/sample/router.dart';

class RouterMain {
  static const String initialRoute = SampleRouter.todosRoute;
  static List<GetPage> routes = [...SampleRouter.routes];
}
