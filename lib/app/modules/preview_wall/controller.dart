import 'dart:io';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:fuse_walls/app/data/services/wall_services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class PreviewWallController extends GetxController {
  var path = "";
  File wallFile = File("");

  @override
  void onInit() async {
    var args = Get.arguments;
    path = args["path"];
    await Permission.storage.request();
    wallFile = await getImageFileFromAssets(path);
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
      WallpaperManagerFlutter().setwallpaperfromFile(wallFile, location);
    }
  }

  void shareWallpaper() {
    Share.shareFiles([wallFile.path]);
  }

  void copyToDownloadsFoler() async {
    await Permission.storage.request();
    Directory? tempDir = await DownloadsPathProvider.downloadsDirectory;
    String tempPath = tempDir!.path;
    await wallFile.copy("$tempPath/${path.split('/').last}");
    Get.showSnackbar(const GetSnackBar(
      title: "Success",
      duration: Duration(seconds: 2),
      message: "Wallpaper copied to downloads folder",
    ));
  }
}
