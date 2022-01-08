import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CategoryMenuController extends GetxController {
  late ScrollController categoryScrollController = ScrollController();
  var scrollOffset = 0.0.obs;

  @override
  void onInit() {
    categoryScrollController.addListener(() {
      scrollOffset.value = categoryScrollController.position.pixels;
    });
    super.onInit();
  }

  @override
  void onClose() {
    categoryScrollController.dispose();
    super.onClose();
  }
}
