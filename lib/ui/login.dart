import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wislist/models/product_model.dart';
import 'package:wislist/models/token_model.dart';
import 'package:wislist/resources/mywishlist_repository.dart';
import 'package:wislist/utility/Statics.dart';
import 'package:wislist/utility/themes.dart';

import '../localizations.dart';
import 'Example.dart';






class Login extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        MyWishListLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale("en"), Locale("tr")],

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool rememberme = true;
  bool localRememberMe = false;
  SharedPreferences prefs;

  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  void _rememberMe() {
    setState(() {
      rememberme = !rememberme;
    });
  }

  @override
  void initState() {
    super.initState();
    _SharedPreferences();
  }

  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  _SharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    localRememberMe = prefs.getBool('rememberme') ?? false;
    if (localRememberMe)
      userNameController.text = prefs.getString('username') ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        backgroundColor: MyWishlistColors.shark[50],
        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                appIcon,
                new Column(children: <Widget>[
                  new Container(
                    decoration: new BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: MyWishlistColors.teak[50],
                            width: 1.0,
                          ),
                        )),
                    margin: new EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 80.0),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'images/ic_username.png',
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                        ),
                        Expanded(
                            child: new Container(
                              margin: new EdgeInsets.only(left: 10.0),
                              child: TextField(
                                controller: userNameController,
                                style: TextStyle(
                                  color: MyWishlistColors.white[50],
                                ),
                                cursorColor: MyWishlistColors.teak[50],
                                keyboardType: TextInputType.text,
                                autofocus: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: MyWishlistLocalizations.of(context).txtHintUserName,

                                    hintStyle: TextStyle(

                                        color: MyWishlistColors.white[50],
                                        fontFamily: 'ProximaNovaRegular')),
                              ),
                            ))
                      ],
                    ),
                  ),
                  new Container(
                    decoration: new BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: MyWishlistColors.teak[50],
                            width: 1.0,
                          ),
                        )),
                    margin: new EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'images/ic_password.png',
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                        ),
                        Expanded(
                            child: new Container(
                              margin: new EdgeInsets.only(left: 10.0),
                              child: TextField(
                                controller: passwordController,
                                style: TextStyle(
                                  color: MyWishlistColors.white[50],
                                ),
                                cursorColor: MyWishlistColors.teak[50],
                                keyboardType: TextInputType.text,
                                autofocus: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: MyWishlistLocalizations.of(context).txtHintPassword,
                                    hintStyle: TextStyle(
                                        color: MyWishlistColors.white[50],
                                        fontFamily: 'ProximaNovaRegular')),
                              ),
                            ))
                      ],
                    ),
                  )
                ]),
                new Container(
                    color: MyWishlistColors.teak[50],
                    margin: new EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 30.0),
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new GestureDetector(
                            onTap: () async {
                              if (UsernameChoice(userNameController.text) !=
                                  true) {
                                _key.currentState.showSnackBar(new SnackBar(
                                    content: new Text("Geçerli mail giriniz")));
                                return;
                              }

                              if (passwordController.text.length < 6) {
                                _key.currentState.showSnackBar(new SnackBar(
                                    content: new Text(
                                        "6 haneden büyük şifre yazınız!")));
                                return;
                              }


                              TokenRequestModel requestModel = new TokenRequestModel(
                                  grant_type: "password",
                                  username: userNameController.text,
                                  password: passwordController.text);

                              TokenResponseModel responseModel = await Repository()
                                  .fetchToken(MyWishlistApi.TOKEN_API,
                                  body: requestModel.toMap());

                              if (responseModel.access_token != null) {
                                if (rememberme) {
                                  prefs.setString(
                                      "username", userNameController.text);
                                  prefs.setBool("rememberme", true);

                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Example()));
                                }
                                else {
                                  prefs.setString("username", null);
                                  prefs.setBool("rememberme", false);

                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Example()));
                                }

                                prefs.setString(
                                    "token", responseModel.access_token);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Example()),
                                );
                              } else
                                _key.currentState.showSnackBar(new SnackBar(
                                    content: new Text(
                                        responseModel.error_description)));


                              ProductListRequestModel requestListModel =
                              new ProductListRequestModel(
                                  Page: '0', updateDate: "null");

                              ProductListResponseModel responseListModel = await Repository()
                                  .fetchProductList(
                                  MyWishlistApi.WISHLISTPRODUCTS_API,
                                  responseModel.access_token,
                                  body: requestListModel.toMap());

                              if (rememberme) {
                                prefs.setString(
                                    "username", userNameController.text);
                                prefs.setBool("rememberme", true);
                              } else {
                                prefs.setString("username", null);
                                prefs.setBool("rememberme", false);
                              }
                            },
                            child: Center(
                              child: Text(
                                MyWishlistLocalizations.of(context).txtBtnLogin,
                                style: TextStyle(
                                    color: MyWishlistColors.white[50],
                                    fontFamily: 'ProximaNovaBold',
                                    fontSize: 18),
                              ),
                            )),
                      ],
                    )),
                new Container(
                  margin: new EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new GestureDetector(
                        onTap: () {
                          _rememberMe();
                        },
                        child: Image.asset(
                          rememberme
                              ? 'images/ic_radiobutton_selected.png'
                              : 'images/ic_radiobutton.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        margin: new EdgeInsets.only(left: 10.0),
                        child: Text(
                          MyWishlistLocalizations.of(context).txtCbRemember,
                          style: TextStyle(
                              color: MyWishlistColors.teak[50],
                              fontFamily: 'ProximaNovaRegular',
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )));
  }

  Widget appIcon = new Container(
    margin: new EdgeInsets.only(top: 80.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'images/ic_gbjlogo.png',
          width: 170,
          height: 170,
          fit: BoxFit.contain,
        ),
      ],
    ),
  );

  bool UsernameChoice(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }
}