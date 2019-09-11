

import 'image_list.dart';

class ProductListModel {
  int _WishlistId;
 int _NewProductId;
 int _VariantId;
 int _VariantNo;
 int _ItemId;
 int _CollectionGroupId;
 String _Comment;
  double _SalesPrice;
  double _TotalCost;
  double _Weight;
  String _ProductCode;
  int _ItemTypeId;
  List<int> _Gemstones = [];
  List<ImageListModel> _Images = [];


  ProductListModel(json) {
    _WishlistId = json['WishlistId'];

    _NewProductId = json['NewProductId '];

    _VariantId = json['VariantId'];

    _VariantNo = json['VariantNo'];

    _ItemId = json['ItemId'];

    _CollectionGroupId = json['CollectionGroupId'];

    _Comment = json['Comment'];

    _SalesPrice = json['SalesPrice'];

    _TotalCost = json['TotalCost'];

    _Weight = json['Weight'];

    _ProductCode = json['ProductCode'];

    _ItemTypeId = json['ItemTypeId'];


    _Weight = json['Weight'];

    _ProductCode = json['ProductCode'];

    _ItemTypeId = json['ItemTypeId'];

    for (int i = 0; i < json['Gemstones'].length; i++) {
      _Gemstones.add(json['Gemstones'][i]);
    }
    List<ImageListModel> temp = [];

    for (int i = 0; i < json['Images'].length; i++) {
      ImageListModel imageresult = ImageListModel(json['Images'][i]);
      temp.add(imageresult);
    }
    _Images=temp;


  }

  int get WishlistId => _WishlistId;

  int get NewProductId => _NewProductId;

  int get VariantId => _VariantId;

  int get VariantNo => _VariantNo;

  int get ItemId => _ItemId;

  int get CollectionGroupId => _CollectionGroupId;

  String get Comment => _Comment;

  double get SalesPrice => _SalesPrice;

  double get TotalCost => _TotalCost;

  double get Weight => _Weight;

  String get ProductCode => _ProductCode;

  int get ItemTypeId => _ItemTypeId;

  List<int> get Gemstones => _Gemstones;

  List<ImageListModel> get images => _Images;



}
