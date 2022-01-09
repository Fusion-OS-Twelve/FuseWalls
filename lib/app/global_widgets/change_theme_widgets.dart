import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:fuse_walls/app/core/theme/app_theme.dart';
import 'package:fuse_walls/app/data/providers/theme_provider.dart';
import 'package:fuse_walls/app/data/services/theme_services.dart';
import 'package:get/get.dart';

Widget changeThemeWidget(context, controller) {
  return GestureDetector(
      onTap: () => showAdaptiveActionSheet(
              context: context,
              bottomSheetColor: getMonetBGColor(context),
              actions: [
                BottomSheetAction(
                    title: const Text("Light Mode"),
                    onPressed: () {
                      changeThemeMode(ThemeMode.light);
                      controller.getAccetColor;
                      Get.back();
                    }),
                BottomSheetAction(
                    title: const Text("Dark Mode"),
                    onPressed: () {
                      changeThemeMode(ThemeMode.dark);
                      controller.getAccetColor;
                      Get.back();
                    })
              ]),
      child: Icon(
        themeMode.value == ThemeMode.light ? Icons.wb_sunny : Icons.mode_night,
        color: getMonetOnBGColor(context),
      ));
}
