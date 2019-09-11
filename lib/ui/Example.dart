import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wislist/blocs/product_bloc.dart';
import 'package:wislist/models/product_model.dart';
import 'package:wislist/resources/mywishlist_repository.dart';
import 'package:wislist/utility/Statics.dart';

import 'package:wislist/utility/themes.dart';

class Example extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: MyWishlistColors.shark[50],
      body: Column(children: <Widget>[
        Container(
          height: 70,
          color: MyWishlistColors.shark[50],
          padding: EdgeInsets.only(top: 20),
          child: Row(children: <Widget>[
            Expanded(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 60,
                      child: Image.asset(
                        'images/ic_logout.png',
                        width: 25,
                        height: 25,
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 23),
                      child: Text(
                        "MY WISHLIST",
                        style: TextStyle(
                          color: MyWishlistColors.white[50],
                          fontFamily: 'ProximaNovaBold',
                          fontSize: 15,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        child: Image.asset(
                          'images/ic_settings.png',
                          width: 25,
                          height: 25,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          'images/ic_refresh.png',
                          width: 25,
                          height: 25,
                          fit: BoxFit.contain,
                        ),
                      )
                    ])),
          ]),
        ),

        Container(

          height: 520,
          color: MyWishlistColors.teak[50],
          child: StreamBuilder(
            stream: bloc.allproduct,
            builder: (context, AsyncSnapshot<ProductListResponseModel> snapshot) {
              if (snapshot.hasData) {
                return buildList(snapshot);
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            },
          ) ,

        ),

        Expanded(
          child: Container(
            height: 60,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(

                child: Container(
                  height: 60,
                  width: 178,
                  color: MyWishlistColors.shark[50],
                  child: Center(

                    child: Text(
                      "FILTER",

                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ),
          ),
                Container(
                  height: 60,
                  width: 180,
                  color: MyWishlistColors.shark[50],
                  child: Center(
                    child: Text(
                      "CREATE PDF",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );

  }

  Widget buildList(AsyncSnapshot<ProductListResponseModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.products.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return  Image.network('${snapshot.data.products[index].images[index].BlobUrl}',
            fit: BoxFit.cover,


          );

  }
    );}
   
}