import 'package:flutter/services.dart';

Future<String> getAllWallpapers() async {
  final manifestJson = await rootBundle.loadString('AssetManifest.json');
  return manifestJson;
}
