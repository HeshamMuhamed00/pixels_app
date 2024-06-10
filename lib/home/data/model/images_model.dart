class ImageModels {
  final int imageID;
  final String imageAlt;
  final String imagePotraitPath;

  const ImageModels({
    required this.imageID,
    required this.imageAlt,
    required this.imagePotraitPath,
  });

  factory ImageModels.fromJson(Map<String, dynamic> json) => ImageModels(
        imageID: json["id"] as int,
        imageAlt: json["alt"] as String,
        imagePotraitPath: json["src"]["portrait"] as String,
      );

  ImageModels.emptyConstructor({
    this.imageID = 0,
    this.imageAlt = '',
    this.imagePotraitPath = '',
  });
}
