import 'package:fuse_walls/app/data/enums/wall_enums.dart';

class WallModel {
  String path;
  WallType walltype;
  String thumbPath;
  WallModel(
      {required this.path, required this.walltype, required this.thumbPath});
}
