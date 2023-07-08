import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mail_demo/common/network/model/request/account_creation_request.dart';
import '../controllers/auth_controller.dart';
import '../custom_widgets/rounded_input_field.dart';
import '../custom_widgets/rounded_password_field.dart';
import '../utils/colors.dart';
import '../utils/custom_textstyle_header.dart';

class LoginView extends StatelessWidget {

  AuthController authController = Get.put(AuthController());
  String userEmail = "";
  String username = "";
  String password = "";
  String authToken = "";
  final box = GetStorage();
  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    authController = Get.find();

    return Scaffold(
        appBar: Appbar.getDefaultAppBar("Login", context),
        body: form(context)
    );
  }

  Widget form(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.mail_outline_outlined,
                    color: Colors.black,
                    size: 200,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Log in',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 40,
                          color: Colors.black)),
                  RoundedInputField(
                    hintText: "Email",
                    onChanged: (value) {},
                    textEditingController: textEditingController1,
                    domain: "",
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {},
                    textEditingController: textEditingController,
                  ),
                  _loginButton(context),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _loginButton(BuildContext context) {
    return Obx(() {
      if (authController.isLoading.value) {
        return SpinKitCubeGrid(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? redColor : lightRedColor,
              ),
            );
          },
        );
      } else {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(19),
            child: ElevatedButton(
              child: Text(
                "Login",
                style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
              ),
              onPressed: () {
                username = textEditingController1.text;
                password = textEditingController.text;
                authController.getToken(UserAuthRequest(address: username, password: password), context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            ),
          ),
        );
      }
    });
  }}
