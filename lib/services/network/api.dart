import 'dart:convert';

import 'package:flutter_starter_project/providers/info/api_urls.dart';
import 'package:flutter_starter_project/providers/info/http_status_code.dart';

import 'http.dart';
import 'package:http/http.dart' as http;

import '../storage.dart';

class APIService {
  static Future<http.Response> sendData(String methodType, String url,
      {Map<String, String> headers = const {'content-type': 'application/json'},
      Map<String, String> body = const {},
      bool haveAuth = true}) async {
    // HAVE AUTH-----------------------------------------------------------------
    if (haveAuth && Storage.has(Storage.accessToken)) {
      var token = await Storage.get(Storage.accessToken);
      headers = {"Authorization": "Bearer " + token, ...headers};

      // REFRESH TOKEN PART [If u handle this in client side use this]
      if (Storage.has(Storage.refreshToken)) {
        var res =
            await httpSendData(methodType, url, body: body, headers: headers);

        if (res.statusCode == HttpStatusCode.unaouthorized) {
          var refreshToken = await Storage.get(Storage.refreshToken);
          var resRefToken = await httpSendData(
              MethodTypeSendData.post, APIURLs.refreshToken,
              body: {Storage.refreshToken: refreshToken},
              headers: const {'content-type': 'application/json'});

          if (resRefToken.statusCode == HttpStatusCode.ok) {
            Map jsonMap = json.decode(res.body);
            Storage.set(Storage.accessToken, jsonMap[Storage.accessToken]);
          } else {
            return await Future.delayed(
                const Duration(milliseconds: 0), () => res);
          }
        } else {
          return await Future.delayed(
              const Duration(milliseconds: 0), () => res);
        }
      }
    }
    // HAVE AUTH-----------------------------------------------------------------

    return await httpSendData(methodType, url, body: body, headers: headers);
  }
}

class MethodTypeSendData {
  static const String post = 'POST', get = 'GET';
}
