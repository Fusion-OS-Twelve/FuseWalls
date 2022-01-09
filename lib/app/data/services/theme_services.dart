import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:fuse_walls/app/data/providers/theme_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:palette_generator/palette_generator.dart';

void changeThemeMode(ThemeMode newThemeMode) {
  final box = GetStorage();
  Get.changeThemeMode(newThemeMode);
  themeMode.value = newThemeMode;
  box.write('themeMode', newThemeMode == ThemeMode.dark ? 'dark' : 'light');
}

List<BottomSheetAction> themeSelectorAction = [
  BottomSheetAction(
      title: const Text("Light Mode"),
      onPressed: () {
        changeThemeMode(ThemeMode.light);
        Get.back();
      }),
  BottomSheetAction(
      title: const Text("Dark Mode"),
      onPressed: () {
        changeThemeMode(ThemeMode.dark);
        Get.back();
      })
];

// Future<PaletteGenerator> getDominantColor(String imagePath) async {
//   var paletteGenerator =
//       await PaletteGenerator.fromImageProvider(AssetImage(imagePath));
//   return paletteGenerator;
// }
