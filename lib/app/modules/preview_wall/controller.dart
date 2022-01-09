import 'dart:io';
import 'package:external_path/external_path.dart';
import 'package:fuse_walls/app/data/services/wall_services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class PreviewWallController extends GetxController with StateMixin {
  var path = "";
  var wallFile = File("").obs;
  // Color? accentColor = Get.iconColor;

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    var args = Get.arguments;
    path = args["path"];
    await Permission.storage.request();
    wallFile.value = await getImageFileFromAssets(path);
    // await getAccetColor();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  @override
  void onClose() {
    path = "";

    super.onClose();
  }

  void setWallpaper({required int location}) async {
    await Permission.storage.request();
    if (await Permission.storage.status.isGranted) {
      WallpaperManagerFlutter().setwallpaperfromFile(wallFile.value, location);
    }
    Get.back();
  }

  void shareWallpaper() {
    Share.shareFiles([wallFile.value.path]);
  }

  void copyToDownloadsFoler() async {
    await Permission.storage.request();
    var downloadPath = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);

    await wallFile.value
        .copy("$downloadPath/${path.split('/').last}")
        .then((value) => Get.showSnackbar(const GetSnackBar(
              title: "Success",
              duration: Duration(seconds: 2),
              message: "Wallpaper copied to downloads folder",
            )));
  }

  // Future<void> getAccetColor() async {
  //   PaletteGenerator generator = await getDominantColor(path);
  //   // accentColor = themeMode.value == ThemeMode.dark
  //   //     ? generator.darkVibrantColor?.color
  //   //     : generator.lightVibrantColor?.color;
  //   accentColor = generator.dominantColor?.color;
  // }
}
