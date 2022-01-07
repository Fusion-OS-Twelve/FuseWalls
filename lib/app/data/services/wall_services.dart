import 'dart:convert';

import 'package:fuse_walls/app/data/enums/wall_enums.dart';
import 'package:fuse_walls/app/data/models/wall_model.dart';
import 'package:fuse_walls/app/data/providers/wall_provider.dart';

Future<dynamic> fillWallpapersList(WallType wallType) async {
  String type = wallType == WallType.anime ? "anime" : "material";

  String wallpaperString = await getAllWallpapers();
  var wallpaperJson = json.decode(wallpaperString);
  List listWalls = <WallModel>[];
  wallpaperJson.keys
      .where((String key) => key.startsWith('assets/walls/$type'))
      .forEach(
          (path) => {listWalls.add(WallModel(path: path, walltype: wallType))});
  return listWalls;
}
