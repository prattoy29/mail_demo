import 'package:flutter/material.dart';
import 'package:mail_demo/custom_widgets/text_field_container.dart';

import '../utils/colors.dart';

class RoundedInputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String domain;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged, required this.textEditingController, required this.domain,
  }) : super(key: key);

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
      child: TextFormField(
        onChanged: onChanged,
        controller: textEditingController,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: blackColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
          suffixText: domain
        ),
      ),
    );
  }
}
