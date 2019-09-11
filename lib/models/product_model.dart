import 'package:wislist/models/product_list.dart';

class ProductListRequestModel {
  final String Page;
  final String updateDate;

  ProductListRequestModel({this.Page, this.updateDate});

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["Page"] = Page;
    map["updateDate"] = updateDate;
    return map;
  }
}

class ProductListResponseModel {
  bool _Success;
  int _RecordCount;
  int _PageCount;
  String _UpdateDate;
  List<ProductListModel> _Products = [];

  ProductListResponseModel.fromJson(Map<String, dynamic> json) {
    _Success=json['Success'];
    _RecordCount=json['RecordCount'];
    _PageCount=json['PageCount'];
    _UpdateDate=json['UpdateDate'];

    List<ProductListModel> temp = [];

    for (int i = 0; i < json['List'].length; i++) {
      ProductListModel result = ProductListModel(json['List'][i]);
      temp.add(result);
    }
    _Products=temp;
  }

  bool get Success => _Success;

  int get RecordCount => _RecordCount;

  int get PageCount => _PageCount;

  String get UpdateDate => _UpdateDate;

  List<ProductListModel> get products => _Products;
}
