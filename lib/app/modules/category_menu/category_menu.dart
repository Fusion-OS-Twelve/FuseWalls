import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuse_walls/app/data/enums/wall_enums.dart';

import 'local_widgets/category_card.dart';

class CategoryMenu extends StatelessWidget {
  const CategoryMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                alignment: Alignment.topCenter,
                child: const Text(
                  "FuseWalls.",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontFamily: "Satisfy", fontSize: 32, shadows: [
                    Shadow(
                      offset: Offset(0, 4.0),
                      blurRadius: 4.0,
                      color: Color(0x25000000),
                    ),
                  ]),
                ),
              ),
              NotificationListener(
                onNotification: (OverscrollIndicatorNotification? overscroll) {
                  overscroll!.disallowIndicator();
                  return true;
                },
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const CategoryCard(wallType: WallType.anime),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    const CategoryCard(wallType: WallType.material)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
