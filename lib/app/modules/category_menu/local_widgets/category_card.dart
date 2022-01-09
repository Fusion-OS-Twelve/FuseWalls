import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:fuse_walls/app/routes/routes.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.wallType}) : super(key: key);

  final String wallType;
  static const String thumbnailUri = "assets/walls/category_thumb/";
  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;
    return AspectRatio(
        aspectRatio: 285 / 228,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              fit: StackFit.expand,
              children: [
                OctoImage(
                  placeholderBuilder:
                      OctoPlaceholder.circularProgressIndicator(),
                  filterQuality: FilterQuality.high,
                  image: AssetImage(
                      thumbnailUri + (wallType.toLowerCase() + ".png")),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Blur(
                    blur: 4,
                    blurColor: const Color(0xFFBBBBBB),
                    colorOpacity: 0.1,
                    child: SizedBox(
                      height: height * 0.07,
                      width: width,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    margin: const EdgeInsets.only(right: 18),
                    alignment: Alignment.centerRight,
                    child: Text(
                      wallType,
                      style: const TextStyle(
                        fontFamily: "Satisfy",
                        color: Colors.black,
                        fontSize: 34.0,
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
                )
              ],
            )));
  }
}
