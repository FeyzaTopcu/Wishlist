class TokenRequestModel {

  final String grant_type;
  final String username;
  final String password;

  TokenRequestModel({this.grant_type, this.username, this.password});

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["grant_type"] = grant_type;
    map["username"] = username;
    map["password"] = password;
    return map;
  }

}

class TokenResponseModel {
  final String username;
  final String access_token;
  final String token_type;
  final int expires_in;
  final String error;
  final String error_description;


  TokenResponseModel({this.username,this.error,this.error_description,this.access_token, this.expires_in, this.token_type});

   factory TokenResponseModel.fromJson(Map<String, dynamic> json) {
     return TokenResponseModel(
       access_token: json['access_token'],
       expires_in: json['expires_in'],
       token_type: json['token_type'],
     );
   }

}