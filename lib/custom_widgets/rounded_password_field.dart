import 'package:flutter/material.dart';
import 'package:mail_demo/custom_widgets/text_field_container.dart';

import '../utils/colors.dart';

class RoundedPasswordField extends StatefulWidget {
  final TextEditingController textEditingController;
  final ValueChanged<String> onChanged;

  const RoundedPasswordField(
      {Key? key, required this.textEditingController, required this.onChanged})
      : super(key: key);

  @override
  _RoundedPasswordFieldState createState() =>
      _RoundedPasswordFieldState(textEditingController, onChanged);
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  final TextEditingController textEditingController;
  final ValueChanged<String> onChanged;
  bool _obscureText = true;
  bool iconSwitch = true;
  IconData icons = Icons.visibility_off;

  _RoundedPasswordFieldState(this.textEditingController, this.onChanged);

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
      iconSwitch = !iconSwitch;
      if (iconSwitch) {
        icons = Icons.visibility_off;
      } else if (!iconSwitch) {
        icons = Icons.visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 2.0),
            blurRadius: 1.0,
          ),
        ],
      ),
      child: TextField(
        obscureText: _obscureText,
        onChanged: onChanged,
        controller: textEditingController,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: blackColor,
          ),
          suffixIcon: InkWell(
            onTap: _toggle,
            child: Icon(
              icons,
              color: blackColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
