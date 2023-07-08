import 'package:dio/dio.dart';
import '../../../../common/network/dio/dio_client.dart';
import '../../../../common/network/dio/endpoints.dart';

class DomainService {
  static DioClient dioClient = DioClient();

  static Future<Response> fetchDomainList() async {
    try {
      final response = await dioClient.get(Endpoints.getDomains);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
