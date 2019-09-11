class ImageListModel {
  int _ImageId;
  String _BlobUrl;
  bool _DefaultImage;

  ImageListModel(json) {
    _ImageId = json['ImageId'];
    _BlobUrl = json['BlobUrl'];
    _DefaultImage = json['DefaultImage'];
  }

  int get ImageId => _ImageId;

  String get BlobUrl => _BlobUrl;

  bool get DefaultImage => _DefaultImage;


}