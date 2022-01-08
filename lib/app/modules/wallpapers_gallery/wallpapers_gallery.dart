import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:fuse_walls/app/modules/wallpapers_gallery/controller.dart';
import 'package:fuse_walls/app/routes/routes.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class WallpapersGallery extends GetView<WallpapersGalleryController> {
  const WallpapersGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back;
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              NotificationListener(
                  onNotification:
                      (OverscrollIndicatorNotification? overscroll) {
                    overscroll!.disallowIndicator();
                    return true;
                  },
                  child: GetX<WallpapersGalleryController>(
                    initState: (state) {
                      Get.find<WallpapersGalleryController>();
                    },
                    builder: (_) {
                      return GridView.builder(
                        padding: const EdgeInsets.only(
                            top: 80, left: 20, right: 20, bottom: 20),
                        controller: controller.gridController,
                        itemCount: _.wallsTobeDisplayed.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 14,
                                childAspectRatio: 0.6,
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  OctoImage(
                                    placeholderBuilder: OctoPlaceholder
                                        .circularProgressIndicator(),
                                    filterQuality: FilterQuality.none,
                                    image: AssetImage(controller
                                        .wallsTobeDisplayed[index].thumbPath),
                                    fit: BoxFit.cover,
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.PREVIEW, arguments: {
                                          "path":
                                              _.wallsTobeDisplayed[index].path
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ));
                        },
                      );
                    },
                  )),
              Obx(() => Blur(
                  blur: controller.scrollOffset.value == 0 ? 0 : 8,
                  child: Container(
                    height: 80,
                  ))),
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
                    Text(
                      controller.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
            ],
          ),
        ),
      ),
    );
  }
}
