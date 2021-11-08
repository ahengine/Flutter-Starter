import '../../services/storage.dart';

import '../../services/network/api.dart';
import 'package:http/http.dart' as http;
import '../info/api_urls.dart';

// Extra Sample for Auth [without UI]

class AuthProvider {
  // Login/Register by Phone number
  static Future<http.Response> login(String phoneNum) async =>
      await APIService.sendData(
          MethodTypeSendData.post, APIURLs.usersSendVerificationCodeURL,
          body: {"phoneNumber": phoneNum});

  // Verify Login/Register by Phone Number
  static Future<http.Response> verifyLogin(
          String phoneNum, String code) async =>
      await APIService.sendData(
          MethodTypeSendData.post, APIURLs.usersVerfiyRegisterCodeURL,
          body: {"phoneNumber": phoneNum, "verificationCode": code});

  // We Have Refresh Token Provider in API Service / This is Extra way
  static Future<http.Response> refreshToken() async {
    String refreshToken = await Storage.get(Storage.refreshToken);
    return await APIService.sendData(
        MethodTypeSendData.get, APIURLs.refreshToken,
        body: {Storage.refreshToken: refreshToken});
  }
}
