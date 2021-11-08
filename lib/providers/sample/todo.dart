import '../../services/network/api.dart';
import 'package:http/http.dart' as http;
import '../info/api_urls.dart';

// Extra Sample for Auth [without UI]

class TodoProvider {
  // Get All
  static Future<http.Response> getAll() async =>
      await APIService.sendData(MethodTypeSendData.get, APIURLs.todosUrl,
          haveAuth: false);

  // Get Item Detail
  static Future<http.Response> getItem(int id) async =>
      await APIService.sendData(MethodTypeSendData.get, APIURLs.todosUrl + id,
          haveAuth: false);
}
