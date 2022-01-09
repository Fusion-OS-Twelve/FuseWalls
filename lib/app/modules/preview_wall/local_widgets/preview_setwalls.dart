import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';

Widget setWallsWidget(context, controller) {
  return SizedBox(
    height: 50,
    child: TextButton(
      onPressed: () {
        showAdaptiveActionSheet(
            context: context,
            androidBorderRadius: 20,
            bottomSheetColor: Theme.of(context).colorScheme.background,
            actions: [
              BottomSheetAction(
                  title: const Text("Home Screen"),
                  onPressed: () {
                    controller.setWallpaper(location: 1);
                  }),
              BottomSheetAction(
                  title: const Text("Lock Screen"),
                  onPressed: () {
                    controller.setWallpaper(location: 2);
                  }),
              BottomSheetAction(
                  title: const Text("Home & Lock Screen"),
                  onPressed: () {
                    controller.setWallpaper(location: 3);
                  })
            ]);
      },
      child: Text(
        "SET WALLPAPER",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Theme.of(context).colorScheme.onPrimary),
      ),
      style: TextButton.styleFrom(
          padding: const EdgeInsets.all(14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Theme.of(context).colorScheme.primary),
    ),
  );
}
