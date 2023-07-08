import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mail_demo/common/network/model/response/domainResponse.dart';
import 'package:mail_demo/services/domain_service.dart';

import '../../../../common/network/dio/dio_exceptions.dart';

class DomainController extends GetxController {
  var isLoading = true.obs;
  var domainList = Rxn<DomainResponse>();

  void fetchDomainList() async {
    var response = await DomainService.fetchDomainList();
    try {
      isLoading.value = true;
      domainList.value = DomainResponse.fromMap(response.data);
      isLoading.value = false;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
