import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:octo_image/octo_image.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';

import 'controller.dart';

class PreviewWall extends GetView<PreviewWallController> {
  const PreviewWall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OctoImage(
          image: AssetImage(controller.path.value),
          fit: BoxFit.cover,
          placeholderBuilder: OctoPlaceholder.circularProgressIndicator(),
        ),
      ],
    );
  }
}
