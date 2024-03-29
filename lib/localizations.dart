import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

//import "l10n/messages_all.dart";

class MyWishlistLocalizations {

  final Locale locale;
  MyWishlistLocalizations(this.locale);


  // Load function will load the string resources from the desired Locale as you can see in the parameter.
  static Future<MyWishlistLocalizations> load(Locale locale) {

    // InitializeMessages this method will be generated by the intl tool,
    // note the import "l10n/messages_all.dart" ,
    // this file contains the method that effectively load the translated messages.
   // return initializeMessages(locale.toString()).then((_) {
   return initializeMessages(locale.toString()).then((_) {

     return MyWishlistLocalizations(locale);
   });

  }

  // Of function will be a helper like any other InheritedWidget to facilitate the access to any string from any part of the app code.
  static MyWishlistLocalizations of(BuildContext context) {
    return Localizations.of<MyWishlistLocalizations>(
        context, MyWishlistLocalizations);
  }

  // Text Titles
  String get txtTitleDetail=> Intl.message(
    'PRODUCT DETAIL',
    name: 'txtTitleDetail',
    args: [],
    locale: locale.toString(),
  );

  String get txtTitleMyWishlist=> Intl.message(
    'MY WISHLIST',
    name: 'txtTitleMyWishlist',
    args: [],
    locale: locale.toString(),
  );

  // App Messages
  String get api_retry_error=> Intl.message(
    'Please retry!',
    name: 'api_retry_error',
    args: [],
    locale: locale.toString(),
  );

  String get api_default_error=> Intl.message(
    'Something wrong happened!',
    name: 'api_default_error',
    args: [],
    locale: locale.toString(),
  );

  String get some_error=> Intl.message(
    'Some Error Occurred!',
    name: 'some_error',
    args: [],
    locale: locale.toString(),
  );

  String get connection_error=> Intl.message(
    'Internet connection lost!',
    name: 'connection_error',
    args: [],
    locale: locale.toString(),
  );

  String get empty_email=> Intl.message(
    'Empty mail!',
    name: 'empty_email',
    args: [],
    locale: locale.toString(),
  );

  String get invalid_email=> Intl.message(
    'Invalid mail!',
    name: 'invalid_email',
    args: [],
    locale: locale.toString(),
  );

  String get empty_password=> Intl.message(
    'Empty password!',
    name: 'empty_password',
    args: [],
    locale: locale.toString(),
  );

  //Checkbox Texts
  String get txtCbRemember=> Intl.message(
    'Remember me',
    name: 'txtCbRemember',
    args: [],
    locale: locale.toString(),
  );

  //Button Texts
  String get txtBtnLogin=> Intl.message(
    'LOGIN',
    name: 'txtBtnLogin',
    args: [],
    locale: locale.toString(),
  );
  String get txtBtnFilter=> Intl.message(
    'FILTER',
    name: 'txtBtnFilter',
    args: [],
    locale: locale.toString(),
  );
  String get txtBtnCreatePdf=> Intl.message(
    'CREATE PDF',
    name: 'txtBtnCreatePdf',
    args: [],
    locale: locale.toString(),
  );
  String get txtBtnActShare=> Intl.message(
    'CREATE SELECTED ITEMS',
    name: 'txtBtnActShare',
    args: [],
    locale: locale.toString(),
  );
  String get txtBtnClearFilter=> Intl.message(
    'CLEAR FILTER',
    name: 'txtBtnClearFilter',
    args: [],
    locale: locale.toString(),
  );
  String get txtBtnOk=> Intl.message(
    'OK',
    name: 'txtBtnOk',
    args: [],
    locale: locale.toString(),
  );
  String get txtBtnSave=> Intl.message(
    'SAVE',
    name: 'txtBtnSave',
    args: [],
    locale: locale.toString(),
  );

  //Label Texts
  String get txtRetailPrice=> Intl.message(
    'Sales Price',
    name: 'txtRetailPrice',
    args: [],
    locale: locale.toString(),
  );
  String get txtJewelryType=> Intl.message(
    'Jewelry Type',
    name: 'txtJewelryType',
    args: [],
    locale: locale.toString(),
  );
  String get txtProductCode=> Intl.message(
    'Product Code',
    name: 'txtProductCode',
    args: [],
    locale: locale.toString(),
  );
  String get txtWeight=> Intl.message(
    'Weight',
    name: 'txtWeight',
    args: [],
    locale: locale.toString(),
  );
  String get txtTotalCost=> Intl.message(
    'Your Cost',
    name: 'txtTotalCost',
    args: [],
    locale: locale.toString(),
  );
  String get txtCollection=> Intl.message(
    'Collection',
    name: 'txtCollection',
    args: [],
    locale: locale.toString(),
  );
  String get txtGemstones=> Intl.message(
    'Gemstones',
    name: 'txtGemstones',
    args: [],
    locale: locale.toString(),
  );
  String get txtApplyFilter=> Intl.message(
    'APPLY FILTER',
    name: 'txtApplyFilter',
    args: [],
    locale: locale.toString(),
  );
  String get txtFilterJT=> Intl.message(
    'FILTER BY\nJEWELRY TYPE',
    name: 'txtFilterJT',
    args: [],
    locale: locale.toString(),
  );
  String get txtFilterCollection=> Intl.message(
    'FILTER BY\nCOLLECTION',
    name: 'txtFilterCollection',
    args: [],
    locale: locale.toString(),
  );

  //EditText Hints
  String get txtHintUserName=> Intl.message(
    'USERNAME',
    name: 'txtHintUserName',
    args: [],
    locale: locale.toString(),
  );
  String get txtHintPassword=> Intl.message(
    'PASSWORD',
    name: 'txtHintPassword',
    args: [],
    locale: locale.toString(),
  );
  String get txtHintYourComment=> Intl.message(
    'YOUR COMMENT',
    name: 'txtHintYourComment',
    args: [],
    locale: locale.toString(),
  );

  //Snackbar Texts
  String get txtCreatedPdf=> Intl.message(
    'Pdf file saved successfully in MyWishList file',
    name: 'txtCreatedPdf',
    args: [],
    locale: locale.toString(),
  );

  //Popup Texts
  String get txtPopupTitle=> Intl.message(
    'TITLE',
    name: 'txtPopupTitle',
    args: [],
    locale: locale.toString(),
  );
  String get txtPopupItemTypeTitle=> Intl.message(
    'ITEM TYPES',
    name: 'txtPopupItemTypeTitle',
    args: [],
    locale: locale.toString(),
  );
  String get txtPopupDispOptionsTitle=> Intl.message(
    'DISPLAY OPTIONS',
    name: 'txtPopupDispOptionsTitle',
    args: [],
    locale: locale.toString(),
  );
  String get txtPopupCGTitle=> Intl.message(
    'COLLECTION GROUPS',
    name: 'txtPopupCGTitle',
    args: [],
    locale: locale.toString(),
  );
  String get txtPopupPermAlert=> Intl.message(
    'You cannot switch to the other menu without access to storage.',
    name: 'txtPopupPermAlert',
    args: [],
    locale: locale.toString(),
  );
  String get txtPopupRoutePerm=> Intl.message(
    'Route Permission',
    name: 'txtPopupRoutePerm',
    args: [],
    locale: locale.toString(),
  );
  String get txtPopupClosePerm=> Intl.message(
    'KAPAT',
    name: 'txtPopupClosePerm',
    args: [],
    locale: locale.toString(),
  );
  String get txtPopupRefusePerm=> Intl.message(
    'Application permissions denied',
    name: 'txtPopupRefusePerm',
    args: [],
    locale: locale.toString(),
  );
  String get txtTitleSalesPrice=> Intl.message(
    'SALES PRICE',
    name: 'txtTitleSalesPrice',
    args: [],
    locale: locale.toString(),
  );
  String get txtTitleComment=> Intl.message(
    'YOUR COMMENT',
    name: 'txtTitleComment',
    args: [],
    locale: locale.toString(),
  );

}


class MyWishListLocalizationDelegate extends LocalizationsDelegate<MyWishlistLocalizations> {

  @override
  Future<MyWishlistLocalizations> load(Locale locale) =>
      MyWishlistLocalizations.load(locale);

  @override
  bool shouldReload(MyWishListLocalizationDelegate old) => false;

  @override
  bool isSupported(Locale locale) => ['en', 'tr'].contains(locale.languageCode);

}