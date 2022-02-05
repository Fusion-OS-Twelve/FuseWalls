import 'package:flutter/material.dart';
import 'package:fuse_walls/app/data/services/wall_services.dart';
import 'package:get/get.dart';

class WallpapersGalleryController extends GetxController with StateMixin {
  var wallsTobeDisplayed = [].obs;
  late ScrollController gridController = ScrollController();
  String title = "";
  var scrollOffset = 0.0.obs;

  // void action(args) async {
  //   wallsTobeDisplayed = await fillWallpapersList(args["wallType"]);
  // }

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    try {
      gridController.addListener(() {
        scrollOffset.value = gridController.position.pixels;
      });
      var args = Get.arguments;
      title = args["categoryName"];
      wallsTobeDisplayed.value =
          await getSpecifiedCategory(args["categoryName"]);
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
    // action(args);
    super.onInit();
  }

  @override
  void onClose() {
    gridController.dispose();
    super.onClose();
  }
}
