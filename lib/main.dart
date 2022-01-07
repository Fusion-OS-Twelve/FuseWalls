import 'package:flutter/material.dart';
import 'package:fuse_walls/app/routes/pages.dart';
import 'package:get/get.dart';

import 'app/routes/routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.pages,
      title: 'FuseWalls',
      initialRoute: Routes.MENU,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
