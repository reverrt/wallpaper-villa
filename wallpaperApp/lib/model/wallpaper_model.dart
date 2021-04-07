class WallpaperModel {
  String photographer;
  String photographerUrl;
  int photographerId;
  SrcModel src;
  WallpaperModel(
      {this.photographer, this.photographerId, this.photographerUrl, this.src});
  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
      photographer: jsonData["photographer"],
      photographerId: jsonData["photographer_id"],
      photographerUrl: jsonData["photographer_url"],
      src: SrcModel.fromMap(jsonData["src"]),
    );
  }
}

class SrcModel {
  String original;
  String small;
  String portrait;
  SrcModel({this.original, this.small, this.portrait});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
        original: jsonData["original"],
        small: jsonData["small"],
        portrait: jsonData["portrait"]);
  }
}
