import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuse_walls/app/data/providers/theme_provider.dart';
import 'package:fuse_walls/app/data/services/theme_services.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';

import 'controller.dart';

class PreviewWall extends GetView<PreviewWallController> {
  const PreviewWall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return WillPopScope(
      onWillPop: () async {
        Get.back;
        return true;
      },
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
            systemNavigationBarColor: Get.theme.scaffoldBackgroundColor),
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 80,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: const Icon(Icons.arrow_back_ios_new),
                        onTap: () {
                          Get.back();
                        },
                      ),
                      const Text(
                        "Preview",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Satisfy",
                            fontSize: 32,
                            shadows: [
                              Shadow(
                                offset: Offset(0, 4.0),
                                blurRadius: 4.0,
                                color: Color(0x25000000),
                              ),
                            ]),
                      ),
                      GestureDetector(
                          onTap: () => showAdaptiveActionSheet(
                              context: context, actions: themeSelectorAction),
                          child: Icon(themeMode.value == ThemeMode.light
                              ? Icons.wb_sunny
                              : Icons.mode_night)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  height: height - 80 - 80,
                  child: PinchZoomImage(
                    image: Image.asset(
                      controller.path,
                      isAntiAlias: true,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  height: 80,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 50,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  shape: const CircleBorder()),
                              onPressed: () {
                                controller.shareWallpaper();
                              },
                              child: const Icon(
                                Icons.share,
                                size: 22,
                              )),
                        ),
                        SizedBox(
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              showAdaptiveActionSheet(
                                  context: context,
                                  androidBorderRadius: 20,
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
                            child: const Text(
                              "SET WALLPAPER",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(14),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: Get.theme.backgroundColor),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: TextButton(
                              onPressed: () {
                                controller.copyToDownloadsFoler();
                              },
                              style: TextButton.styleFrom(
                                  shape: const CircleBorder()),
                              child: const Center(
                                  child: Icon(
                                Icons.download,
                                size: 22,
                              ))),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
