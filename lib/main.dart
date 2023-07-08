import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mail_demo/views/domain_selection_view.dart';
import 'package:mail_demo/views/mail_inbox_view.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final storage = GetStorage();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
        debugShowCheckedModeBanner: false,
      home: storage.read("token") == null
          ? DomainSelectionView(title: 'Mail Demo'): MailInboxView()
    );
  }
}

