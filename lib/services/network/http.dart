import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> httpSendData(String method, String url,
    {Map<String, String> headers = const {'content-type': 'application/json'},
    Map<String, dynamic> body = const {}}) async {
  var request = http.Request(method, Uri.parse(url));
  request.body = json.encode(body);
  request.headers.addAll(headers);
  return http.Response.fromStream(await request.send());
}
