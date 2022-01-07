import 'package:fuse_walls/app/data/enums/wall_enums.dart';
import 'package:fuse_walls/app/data/services/wall_services.dart';
import 'package:get/get.dart';

class WallpapersGalleryController extends GetxController {
  var wallsTobeDisplayed = [].obs;

  String title = "";

  // void action(args) async {
  //   wallsTobeDisplayed = await fillWallpapersList(args["wallType"]);
  // }

  @override
  void onInit() async {
    var args = Get.arguments;
    title = args["wallType"] == WallType.anime ? "Anime" : "Material";
    wallsTobeDisplayed.value = await fillWallpapersList(args["wallType"]);
    // action(args);
    super.onInit();
  }
}
