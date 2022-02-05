import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuse_walls/app/core/theme/app_theme.dart';
import 'package:fuse_walls/app/core/theme/text_theme.dart';
import 'package:fuse_walls/app/modules/category_menu/controller.dart';
import 'package:get/get.dart';

import 'local_widgets/category_card.dart';

class CategoryMenu extends GetView<CategoryMenuController> {
  const CategoryMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.top;
    double height = MediaQuery.of(context).size.height;

    return controller.obx((state) {
      return AnnotatedRegion(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: getMonetBGColor(context),
        ),
        child: Scaffold(
          backgroundColor: getMonetBGColor(context),
          body: Stack(
            children: [
              NotificationListener(
                onNotification: (OverscrollIndicatorNotification? overscroll) {
                  overscroll!.disallowIndicator();
                  return true;
                },
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 80 + topPadding, bottom: 20),
                    controller: controller.categoryScrollController,
                    itemBuilder: (context, index) => CategoryCard(
                          title: controller.categories[index]["name"],
                          thumbnailUrl: controller.categories[index]["thumb"],
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: height * 0.02,
                        ),
                    itemCount: controller.categories.length),
              ),
              Obx(() => Blur(
                  blurColor: getMonetBGColor(context),
                  blur: controller.scrollOffset.value == 0 ? 0 : 8,
                  overlay: SafeArea(
                    child: Text("FuseWalls",
                        textAlign: TextAlign.center,
                        style: getTitleTextStyle(context)),
                  ),
                  child: Container(
                    height: 80 + topPadding,
                  ))),
            ],
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
