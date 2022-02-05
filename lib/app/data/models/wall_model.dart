class WallModel {
  String path;
  String thumbUrl;

  WallModel({required this.path, required this.thumbUrl});

  factory WallModel.fromJson(json) {
    const String _url =
        "https://raw.githubusercontent.com/naufalw/FuseWalls/master/assets/walls/";
    return WallModel(
      path: _url + json['original'],
      thumbUrl: _url + json['compressed'],
    );
  }
}
