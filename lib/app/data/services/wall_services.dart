import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:fuse_walls/app/data/models/wall_model.dart';
import 'package:fuse_walls/app/data/providers/wall_provider.dart';
import 'package:path_provider/path_provider.dart';

Future<dynamic> fillWallpapersList(String wallType) async {
  String wallpaperString = await getAllWallpapers();
  var wallpaperJson = json.decode(wallpaperString);
  List listWalls = <WallModel>[];

  wallpaperJson.keys
      .where((String key) =>
          key.contains(RegExp('assets/walls/${wallType.toLowerCase()}/'
              r'[a-zA-Z]+_[0-9]+\.[a-zA-Z]')))
      .forEach((path) => {
            listWalls.add(WallModel(
                path: path,
                walltype: wallType,
                thumbPath: "assets/walls/${wallType.toLowerCase()}/thumb/" +
                    RegExp(r"[^/]+(?=/$|$)").stringMatch(path).toString()))
          });
  return listWalls;
}

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load(path);
  final wallName = path.split('/').last;

  final file = File('${(await getTemporaryDirectory()).path}/$wallName');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}
