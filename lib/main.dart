import 'package:flutter/material.dart';
import 'package:fuse_walls/app/data/providers/theme_provider.dart';
import 'package:fuse_walls/app/routes/pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/routes.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.pages,
      title: 'FuseWalls',
      initialRoute: Routes.MENU,
      theme: ThemeData.light().copyWith(),
      darkTheme: ThemeData.dark().copyWith(),
      themeMode: getThemeMode(),
    );
  }
}
