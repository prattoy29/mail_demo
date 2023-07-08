import 'package:flutter/material.dart';

class HeaderTextStyle {
  static const TextStyle customHeader = TextStyle(
      fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 22);
  static const TextStyle customHeadline = TextStyle(
    fontFamily: "Poppins",
    fontSize: 16,
    color: Colors.black,);
}

class Appbar {
  static getDefaultAppBar(String title, BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white10,
      centerTitle: true,
      title: Text(title,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Poppins",
          )),
    );
  }
}
