import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mail_demo/common/network/model/response/mail_list_response.dart';
import 'package:mail_demo/services/mail_service.dart';
import '../../../../common/network/dio/dio_exceptions.dart';

class MailController extends GetxController {
  var isLoading = true.obs;
  var mailList = Rxn<MailListResponse>();

  void fetchMails() async {
    var response = await MailService.fetchMails();
    try {
      isLoading.value = true;
      mailList.value = MailListResponse.fromMap(response.data);
      isLoading.value = false;
    } on DioError catch (e) {
      isLoading.value = false;
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
