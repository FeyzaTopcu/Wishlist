import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:wislist/models/image_list.dart';
import 'package:wislist/models/product_list.dart';
import 'package:wislist/models/product_model.dart';
import 'package:wislist/models/token_model.dart';

class MyWishlistNetworkingProvider {
  Client client = Client();

  Future<TokenResponseModel> fetchToken(String url, {Map body}) async {
    final response = await client.post(url, body: body);

    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }

    return TokenResponseModel.fromJson(json.decode(response.body));
  }

  Future<ProductListResponseModel> fetchProductList(String url, String token,
      {Map body}) async {

    Map<String, String> headers = {"Authorization": "Bearer $token"};

    final response = await client.post(url, headers: headers, body: body);

    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }

    return ProductListResponseModel.fromJson(json.decode(response.body));
  }


}
