import 'package:flutter/material.dart';
import 'package:fuse_walls/app/data/providers/wall_provider.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CategoryMenuController extends GetxController with StateMixin {
  late ScrollController categoryScrollController = ScrollController();
  var scrollOffset = 0.0.obs;
  List categories = <Map>[];
  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    await getAllWallpapers();
    categories = allWallpapers["categories"];
    categoryScrollController.addListener(() {
      scrollOffset.value = categoryScrollController.position.pixels;
    });
    change(null, status: RxStatus.success());
    super.onInit();
  }

  @override
  void onClose() {
    categoryScrollController.dispose();
    super.onClose();
  }
}
