import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuse_walls/app/core/theme/app_theme.dart';
import 'package:fuse_walls/app/core/theme/text_theme.dart';
import 'package:fuse_walls/app/data/enums/wall_enums.dart';
import 'package:fuse_walls/app/modules/category_menu/controller.dart';
import 'package:get/get.dart';

import 'local_widgets/category_card.dart';

class CategoryMenu extends GetView<CategoryMenuController> {
  const CategoryMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: getMonetBGColor(context),
      ),
      child: Scaffold(
        backgroundColor: getMonetBGColor(context),
        body: SafeArea(
          child: Stack(
            children: [
              NotificationListener(
                onNotification: (OverscrollIndicatorNotification? overscroll) {
                  overscroll!.disallowIndicator();
                  return true;
                },
                child: ListView(
                  controller: controller.categoryScrollController,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 80, bottom: 20),
                  children: [
                    const CategoryCard(wallType: WallType.anime),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    const CategoryCard(wallType: WallType.material),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    const CategoryCard(wallType: WallType.liquid)
                  ],
                ),
              ),
              Obx(() => Blur(
                  blurColor: getMonetBGColor(context),
                  blur: controller.scrollOffset.value == 0 ? 0 : 8,
                  overlay: Text("FuseWalls",
                      textAlign: TextAlign.center,
                      style: getTitleTextStyle(context)),
                  child: Container(
                    height: 80,
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}
