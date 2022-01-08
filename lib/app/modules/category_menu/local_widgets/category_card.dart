import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:fuse_walls/app/data/enums/wall_enums.dart';
import 'package:fuse_walls/app/routes/routes.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.wallType}) : super(key: key);

  final String wallType;
  static const String thumbnailUri = "assets/walls/category_thumb/";
  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 285 / 228,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image(
              image:
                  AssetImage(thumbnailUri + (wallType.toLowerCase() + ".png")),
              height: height * 0.4,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
              bottom: 0,
              child: Blur(
                alignment: Alignment.centerRight,
                blur: 4,
                blurColor: const Color(0xFFBBBBBB),
                colorOpacity: 0.1,
                child: SizedBox(
                  height: height * 0.08,
                  width: width,
                ),
                overlay: Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Text(
                    wallType,
                    style: const TextStyle(
                      fontFamily: "Satisfy",
                      color: Colors.black,
                      fontSize: 32.0,
                    ),
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.GALLERY,
                      arguments: {"wallType": wallType});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
