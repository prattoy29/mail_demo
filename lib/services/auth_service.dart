import 'package:dio/dio.dart';
import 'package:mail_demo/common/network/model/request/account_creation_request.dart';
import '../../../../common/network/dio/dio_client.dart';
import '../../../../common/network/dio/endpoints.dart';

class AuthService {
  static DioClient dioClient = DioClient();

  static Future<Response> createAccount(
      UserAuthRequest accountCreationRequest) async {
    try {
      final Response response = await dioClient.post(Endpoints.createAccount,
          data: userAuthRequestToMap(accountCreationRequest),
          options: Options(headers: {
            'Content-Type': 'application/json',
          }));
      return response;
    } catch (e) {
      rethrow;
    }
  }
  static Future<Response> getToken(
      UserAuthRequest userAuthRequest) async {
    try {
      final Response response = await dioClient.post(Endpoints.getToken,
          data: userAuthRequestToMap(userAuthRequest),
          options: Options(headers: {
            'Content-Type': 'application/json',
          }));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
