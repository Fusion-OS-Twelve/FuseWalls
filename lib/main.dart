import 'package:dynamic_color/dynamic_color.dart';
import 'package:dynamic_colorscheme/dynamic_colorscheme.dart';
import 'package:flutter/material.dart';
import 'package:fuse_walls/app/data/providers/theme_provider.dart';
import 'package:fuse_walls/app/routes/pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

import 'app/routes/routes.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme? m3Light;
    ColorScheme? m3Dark;
    return DynamicColorBuilder(builder: (CorePalette? palette) {
      if (palette != null) {
        m3Light = DynamicColorScheme.generate(palette, dark: false);
        m3Dark = DynamicColorScheme.generate(palette, dark: true);
      }
      return GetMaterialApp(
        getPages: AppPages.pages,
        title: 'FuseWalls',
        initialRoute: Routes.MENU,
        theme: m3Light == null
            ? ThemeData(colorScheme: ThemeData.light().copyWith().colorScheme)
            : ThemeData(colorScheme: m3Light),
        darkTheme: m3Dark == null
            ? ThemeData(colorScheme: ThemeData.dark().copyWith().colorScheme)
            : ThemeData(colorScheme: m3Dark),
        themeMode: getThemeMode(),
      );
    });
  }
}
