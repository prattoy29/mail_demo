import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../common/network/model/response/domainResponse.dart';
import '../controllers/domain_controller.dart';
import '../utils/custom_textstyle_header.dart';
import 'account_creation_view.dart';
import 'login_view.dart';

class DomainSelectionView extends StatefulWidget {
  const DomainSelectionView({super.key, required this.title});

  final String title;

  @override
  State<DomainSelectionView> createState() => _DomainSelectionViewState();
}

class _DomainSelectionViewState extends State<DomainSelectionView> {
  final storage = GetStorage();
  DomainController domainController = Get.put(DomainController());

  @override
  void initState() {
    super.initState();
    domainController.fetchDomainList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Text(
                "Welcome!",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Please select a domain from below',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Obx(() {
                if (domainController.isLoading.value) {
                  return AlertDialog(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    content: Center(
                      child: Column(
                        children: [
                          SpinKitCubeGrid(
                            itemBuilder: (BuildContext context, int index) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  color: index.isEven
                                      ? Colors.black
                                      : Colors.blueGrey,
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
                    ),
                  );
                } else {
                  return Container(
                    height: size.width/1.5,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount:
                          domainController.domainList.value!.hydraMember!.length,
                      itemBuilder: (BuildContext context, int index) {
                        HydraMember hydra = domainController
                            .domainList.value!.hydraMember![index];
                        return InkWell(
                          onTap: () {
                            Get.to(() => CreateAccountScreen(
                                  domain: "@${hydra.domain!}",
                                ));
                          },
                          child: Container(
                            margin: EdgeInsets.all(3),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.white30,

                                ),
                              ],
                            ),
                            child: Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.mail_outline_outlined,
                                        color: Colors.black,
                                        size: 17,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: hydra.domain!,
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }),
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
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
