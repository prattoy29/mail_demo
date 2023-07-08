import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mail_demo/utils/custom_textstyle_header.dart';

import '../common/network/model/response/mail_list_response.dart';

class MailDetailsView extends StatefulWidget {
  final HydraMemberMail mailDetails;

  const MailDetailsView({Key? key, required this.mailDetails})
      : super(key: key);

  @override
  State<MailDetailsView> createState() => _MailDetailsViewState();
}

class _MailDetailsViewState extends State<MailDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.getDefaultAppBar("", context),
      body: Container(
        padding: EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.mailDetails.subject!,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 22.0,
                  ),
                ),
                Text(
                  DateFormat('EEEE dd MMMM').format(widget.mailDetails.createdAt!),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "From: ${widget.mailDetails.from!.address} ",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.mailDetails.intro!,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 17.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
