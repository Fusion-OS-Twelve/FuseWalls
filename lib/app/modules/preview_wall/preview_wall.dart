import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

import 'controller.dart';

class PreviewWall extends GetView<PreviewWallController> {
  const PreviewWall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back;
        return true;
      },
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
                    GestureDetector(child: const Icon(Icons.wb_sunny)),
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Image(
                    image: AssetImage(controller.path),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 50),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  shape: const CircleBorder()),
                              onPressed: () {
                                controller.shareWallpaper();
                              },
                              child: const Icon(
                                Icons.share,
                                size: 20,
                              ))),
                      const Spacer(),
                      Expanded(
                        flex: 8,
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
                            "Apply",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: const Color(0xFF42B0FF)),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                            onPressed: () {
                              controller.copyToDownloadsFoler();
                              
                            },
                            style: TextButton.styleFrom(
                                shape: const CircleBorder()),
                            child: const Icon(Icons.download)),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
