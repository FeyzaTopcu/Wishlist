import 'package:wislist/models/product_model.dart';
import 'package:wislist/resources/mywishlist_repository.dart';


import 'package:rxdart/rxdart.dart';


class ProductBloc {
  final _repository = Repository();
  final _productFetcher = PublishSubject<ProductListResponseModel>();

  Observable<ProductListResponseModel> get allproduct => _productFetcher.stream;


  fetchProductList(String url, String token, {Map body}) async {
    ProductListResponseModel productListResponseModel = await _repository.fetchProductList(url,token,body: body);
    _productFetcher.sink.add(productListResponseModel);


  }

    dispose() {
    _productFetcher.close();
  }
}

final bloc = ProductBloc();