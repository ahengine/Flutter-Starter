import 'package:flutter/material.dart';
import '../../screens/routers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        textDirection: TextDirection.ltr,
        theme: ThemeData(highlightColor: Colors.indigo[100]),
        initialRoute: RouterMain.initialRoute,
        getPages: RouterMain.routes);
  }
}
