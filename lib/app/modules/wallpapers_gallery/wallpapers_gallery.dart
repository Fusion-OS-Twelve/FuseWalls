import 'package:flutter/material.dart';
import 'package:fuse_walls/app/modules/wallpapers_gallery/controller.dart';
import 'package:get/get.dart';

class WallpapersGallery extends GetView<WallpapersGalleryController> {
  const WallpapersGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: height * 0.15,
              padding: const EdgeInsets.symmetric(vertical: 40),
              alignment: Alignment.topCenter,
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: height * 0.85,
              child: NotificationListener(
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
                                  Image(
                                    filterQuality: FilterQuality.none,
                                    image: AssetImage(controller
                                        .wallsTobeDisplayed[index].path),
                                    fit: BoxFit.cover,
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () async {},
                                    ),
                                  )
                                ],
                              ));
                        },
                      );
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}
