import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:fuse_walls/app/data/enums/wall_enums.dart';

import 'local_widgets/category_card.dart';

class CategoryMenu extends StatelessWidget {
  const CategoryMenu({Key? key}) : super(key: key);

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
              child: const Text(
                "FuseWalls.",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Satisfy", fontSize: 32, shadows: [
                  Shadow(
                    offset: Offset(0, 4.0),
                    blurRadius: 4.0,
                    color: Color(0x25000000),
                  ),
                ]),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: height * 0.85,
              child: NotificationListener(
                onNotification: (OverscrollIndicatorNotification? overscroll) {
                  overscroll!.disallowIndicator();
                  return true;
                },
                child: ListView(
                  children: [
                    const CategoryCard(wallType: WallType.anime),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    const CategoryCard(wallType: WallType.material)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}