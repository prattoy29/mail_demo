import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mail_demo/controllers/mail_controller.dart';
import 'package:mail_demo/views/domain_selection_view.dart';
import 'package:mail_demo/views/mail_details_view.dart';

import '../common/network/model/response/mail_list_response.dart';
import '../utils/colors.dart';
import '../utils/custom_textstyle_header.dart';

class MailInboxView extends StatefulWidget {
  @override
  State<MailInboxView> createState() => _MailInboxViewState();
}

class _MailInboxViewState extends State<MailInboxView> {
  final storage = GetStorage();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  MailController mailController = Get.put(MailController());

  @override
  void initState() {
    super.initState();
    mailController.fetchMails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.getDefaultAppBar("Inbox", context),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Obx(() {
              if (mailController.isLoading.value) {
                return AlertDialog(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  content: Column(
                    children: [
                      SpinKitCubeGrid(
                        itemBuilder: (BuildContext context, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              color:
                                  index.isEven ? Colors.black : Colors.blueGrey,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 7),
                          child: Text(
                            "Fetching Data",
                            style: HeaderTextStyle.customHeadline,
                          )),
                    ],
                  ),
                );
              } else {
                if (mailController.mailList.value!.hydraTotalItems == 0) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.report_gmailerrorred_rounded,
                          size: 70,
                          color: deepRedColor,
                        ),
                        Text(
                          "No mail for now",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return RefreshIndicator(
                    key: _refreshIndicatorKey,
                    onRefresh: () async {
                      mailController.fetchMails();
                    },
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            GestureDetector(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.WARNING,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: 'Logout',
                                  desc: "Are you sure to logout?",
                                  dismissOnTouchOutside: false,
                                  btnOkText: "Yes",
                                  btnOkOnPress: () {
                                    storage.write("token", null);
                                    Get.offAll(DomainSelectionView(title: "Mail Demo"));
                                  },
                                ).show();

                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.logout_outlined,
                                    color: blackColor,
                                    size: 40,
                                  ),
                                  Text(
                                    "Log Out",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Container(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: mailController
                                  .mailList.value!.hydraMember!.length,
                              itemBuilder: (BuildContext context, int index) {
                                HydraMemberMail hydra = mailController
                                    .mailList.value!.hydraMember![index];
                                return InkWell(
                                  onTap: () {
                                    Get.to(() => MailDetailsView(
                                          mailDetails: hydra,
                                        ));
                                  },
                                  child: Container(
                                      margin: EdgeInsets.all(3),
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        color: Colors.white54,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            hydra.from!.name.toString(),
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            "Sub: ${hydra.subject}",
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            hydra.intro!,
                                            overflow: TextOverflow.fade,
                                            maxLines: 1,
                                            softWrap: false,
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      )),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }
            }),
          ),
        ),
      ),
    );
  }
}
