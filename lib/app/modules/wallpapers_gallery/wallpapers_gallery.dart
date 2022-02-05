import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuse_walls/app/core/theme/app_theme.dart';
import 'package:fuse_walls/app/core/theme/text_theme.dart';
import 'package:fuse_walls/app/global_widgets/backscreen_icon.dart';
import 'package:fuse_walls/app/global_widgets/change_theme_widgets.dart';
import 'package:fuse_walls/app/modules/wallpapers_gallery/controller.dart';
import 'package:fuse_walls/app/routes/routes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'local_widgets/wallpaper_frame.dart';

class WallpapersGallery extends GetView<WallpapersGalleryController> {
  const WallpapersGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.top;

    return controller.obx((state) {
      return WillPopScope(
        onWillPop: () async {
          Get.delete<WallpapersGalleryController>();
          Get.back;
          return true;
        },
        child: AnnotatedRegion(
          value: SystemUiOverlayStyle(
              systemNavigationBarColor: getMonetBGColor(context)),
          child: Scaffold(
            backgroundColor: getMonetBGColor(context),
            body: Stack(
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
                          padding: EdgeInsets.only(
                              top: 80 + topPadding,
                              left: 20,
                              right: 20,
                              bottom: 20),
                          controller: controller.gridController,
                          itemCount: _.wallsTobeDisplayed.length,
                          physics: const BouncingScrollPhysics(),
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
                                    WallpaperFrame(
                                      thumbUrl: controller
                                          .wallsTobeDisplayed[index].thumbUrl,
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.PREVIEW,
                                              arguments: {
                                                "path": _
                                                    .wallsTobeDisplayed[index]
                                                    .path
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
                    blurColor: getMonetBGColor(context),
                    blur: controller.scrollOffset.value == 0 ? 0 : 8,
                    overlay: SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            child: backScreenIcon(context),
                            onTap: () {
                              Get.delete<WallpapersGalleryController>();
                              Get.back();
                            },
                          ),
                          Text(toBeginningOfSentenceCase(controller.title)!,
                              textAlign: TextAlign.center,
                              style: getTitleTextStyle(context)),
                          changeThemeWidget(context)
                        ],
                      ),
                    ),
                    child: Container(
                      height: 80 + topPadding,
                    ))),
              ],
            ),
          ),
        ),
      );
    },
        onLoading: AnnotatedRegion(
          value: SystemUiOverlayStyle(
              systemNavigationBarColor: getMonetBGColor(context)),
          child: Scaffold(
            backgroundColor: getMonetBGColor(context),
            body: const Center(child: CircularProgressIndicator()),
          ),
        ));
  }
}
