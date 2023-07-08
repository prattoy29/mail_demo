import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../common/network/dio/dio_client.dart';
import '../../../../common/network/dio/endpoints.dart';

class MailService {
  static DioClient dioClient = DioClient();
  static final storage = GetStorage();


  static Future<Response> fetchMails() async {
    try {
      final response = await dioClient.get(Endpoints.getMails,
          options: Options(headers: {
      "Authorization": "Bearer ${storage.read("token")}",
      }));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
