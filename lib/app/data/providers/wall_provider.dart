import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fuse_walls/app/data/models/wall_model.dart';
import 'package:schttp/schttp.dart';

Map allWallpapers = {"categories": <Map>[]};

Future<void> getAllWallpapers() async {
  var client = ScHttpClient();
  String baseUrl =
      "https://raw.githubusercontent.com/Fusion-OS/FuseWalls/master/assets/walls";
  String request = await client.get("$baseUrl/wallpapers.json");

  var jsonData = json.decode(request == ""
      ? await rootBundle.loadString("assets/walls/wallpapers.json")
      : request);
  allWallpapers["date"] = jsonData["date"];
  for (var k = 0; k < jsonData["categories"].length; k++) {
    List tempWalls = [];
    Map categoryData = jsonData["categories"][k];
    String categoryName = categoryData["name"];
    allWallpapers["categories"].add(
        {"name": categoryName, "thumb": "$baseUrl/${categoryData["thumb"]}"});
    jsonData[categoryName]["paths"]
        .forEach((wall) => tempWalls.add(WallModel.fromJson(wall)));
    allWallpapers[categoryName] = tempWalls;
  }
}
