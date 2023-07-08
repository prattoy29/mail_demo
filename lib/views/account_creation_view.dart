import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mail_demo/common/network/model/request/account_creation_request.dart';
import 'package:mail_demo/views/login_view.dart';
import '../controllers/auth_controller.dart';
import '../custom_widgets/rounded_input_field.dart';
import '../custom_widgets/rounded_password_field.dart';
import '../utils/colors.dart';
import '../utils/custom_textstyle_header.dart';

class CreateAccountScreen extends StatelessWidget {
  final String domain;
  AuthController authController = Get.put(AuthController());
  String userEmail = "";
  String username = "";
  String password = "";
  String authToken = "";
  final box = GetStorage();
  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController = TextEditingController();

  CreateAccountScreen({super.key, required this.domain});

  @override
  Widget build(BuildContext context) {
    authController = Get.find();

    return Scaffold(
        appBar: Appbar.getDefaultAppBar("Create your account", context),
        body: form(context));
  }

  Widget form(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 30, end: 100),
              curve: Curves.bounceOut,
              duration: Duration(seconds: 2),
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Icon(
                  Icons.mail_outline_outlined,
                  color: Colors.black,
                  size: 200,
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text('Sign up',
                style: TextStyle(
                    fontFamily: 'Poppins', fontSize: 40, color: Colors.black)),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {},
              textEditingController: textEditingController1,
              domain: domain,
            ),
            RoundedPasswordField(
              onChanged: (value) {},
              textEditingController: textEditingController,
            ),
            _signupButton(context),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 26),
              child: Row(children: const [
                Expanded(
                    child: Divider(
                  thickness: 2.0,
                )),
                Text("   Or   "),
                Expanded(child: Divider(thickness: 2.0)),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(() => LoginView());
              },
              child: Card(
                elevation: 8,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Colors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget _signupButton(BuildContext context) {
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
                "Sign up",
                style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
              ),
              onPressed: () {
                username = textEditingController1.text;
                password = textEditingController.text;
                authController.createAccount(
                    UserAuthRequest(address: username, password: password),
                    context);
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            ),
          ),
        );
      }
    });
  }
}
