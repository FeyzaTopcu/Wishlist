import 'dart:async';
import 'package:wislist/models/image_list.dart';
import 'package:wislist/models/product_list.dart';
import 'package:wislist/models/product_model.dart';

import 'mywishlist_networking_provider.dart';
import '../models/token_model.dart';

/**
 * Bu repository sınıfı bloc a data akışı sağlayacak merkez noktadır.
 */

class Repository {

  final networkingProvider = MyWishlistNetworkingProvider();

  Future<TokenResponseModel> fetchToken(String url, {Map body}) => networkingProvider.fetchToken(url,body: body);

  Future<ProductListResponseModel> fetchProductList(String url, String token, {Map body}) => networkingProvider.fetchProductList(url,token,body: body);




}


