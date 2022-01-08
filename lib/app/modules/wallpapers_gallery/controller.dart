import 'package:flutter/material.dart';
import 'package:fuse_walls/app/data/enums/wall_enums.dart';
import 'package:fuse_walls/app/data/services/wall_services.dart';
import 'package:get/get.dart';

class WallpapersGalleryController extends GetxController {
  var wallsTobeDisplayed = [].obs;
  late ScrollController gridController = ScrollController();
  String title = "";
  var scrollOffset = 0.0.obs;

  // void action(args) async {
  //   wallsTobeDisplayed = await fillWallpapersList(args["wallType"]);
  // }

  @override
  void onInit() async {
    gridController.addListener(() {
      scrollOffset.value = gridController.position.pixels;
    });
    var args = Get.arguments;
    title = args["wallType"] == WallType.anime ? "Anime" : "Material";
    wallsTobeDisplayed.value = await fillWallpapersList(args["wallType"]);
    // action(args);
    super.onInit();
  }

  @override
  void onClose() {
    gridController.dispose();
    wallsTobeDisplayed.clear();
    super.onClose();
  }
}
