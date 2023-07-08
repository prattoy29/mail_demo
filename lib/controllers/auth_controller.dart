import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mail_demo/common/network/model/request/account_creation_request.dart';
import 'package:mail_demo/common/network/model/response/domainResponse.dart';
import 'package:mail_demo/common/network/model/response/token_response.dart';
import 'package:mail_demo/services/auth_service.dart';
import 'package:mail_demo/services/domain_service.dart';
import 'package:mail_demo/views/mail_inbox_view.dart';

import '../../../../common/network/dio/dio_exceptions.dart';
import '../common/network/model/response/account_creation_response.dart';
import '../utils/colors.dart';
import '../views/login_view.dart';

class AuthController extends GetxController {
  final storage = GetStorage();
  var isLoading = false.obs;
  var accountResponse = Rxn<AccountCreationResponse>();
  var tokenResponse = Rxn<TokenResponse>();

  void createAccount(UserAuthRequest accountCreationRequest,
      BuildContext context) async {
    isLoading.value = true;
    try {
      var response =
      await AuthService.createAccount(accountCreationRequest);
      if (response.statusCode == 201) {
        // isLoading4.value = false;
        accountResponse.value = AccountCreationResponse.fromMap(response.data);
        isLoading.value = false;
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Success',
          desc: "Account Creation Successful",
          dismissOnTouchOutside: false,
          btnOkOnPress: () {
            Get.to(() => LoginView());
          },
        ).show();
      }
    } on DioError catch (e) {
      isLoading.value = false;
      final errorMessage = DioExceptions.fromDioError(e).message;
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: errorMessage,
        btnOkText: "Login",
        btnOkColor: redColor,
        desc: "",
        dismissOnTouchOutside: true,
        btnOkOnPress: () {

        },
      ).show();
      throw errorMessage;
    }
  }

  void getToken(UserAuthRequest userAuthRequest,
      BuildContext context) async {
    isLoading.value = true;
    try {
      var response =
      await AuthService.getToken(userAuthRequest);
      if (response.statusCode == 200) {
        tokenResponse.value = TokenResponse.fromMap(response.data);
        storage.write("token",
            tokenResponse.value?.token.toString());
        isLoading.value = false;
        Get.offAll(MailInboxView());
      }
    } on DioError catch (e) {
      isLoading.value = false;
      final errorMessage = DioExceptions.fromDioError(e).message;

      throw errorMessage;
    }
  }
}
