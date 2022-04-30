import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navi_bar_ex/color/material_color.dart';

class AppTextStyles {
  static const lightTextStyle = TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.w300,
      fontSize: 15,
      fontFamily: 'SegoeUI');

  static const lightWhiteLargeTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w300,
      fontSize: 15,
      fontFamily: 'SegoeUI');

  static const lightWhiteTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w300,
      fontSize: 12,
      fontFamily: 'SegoeUI');

  static var lightColouredTextStyle = TextStyle(
      color: createMaterialColor(Color(0xFF4f51fe)),
      fontWeight: FontWeight.w300,
      fontSize: 13,
      fontFamily: 'SegoeUI');

  static const lightGreyTextStyle = TextStyle(
      color: Colors.black38,
      fontWeight: FontWeight.w300,
      fontSize: 12,
      fontFamily: 'SegoeUI');

  static const lightGreyBigTextStyle = TextStyle(
      color: Colors.black38,
      fontWeight: FontWeight.w300,
      fontSize: 13,
      fontFamily: 'SegoeUI');

  static const boldSmallTextStyle = TextStyle(
    fontSize: 14.0, fontWeight: FontWeight.w700, fontFamily: 'SegoeUI', color: Colors.black);

  static const boldBigBlackTextStyle = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w700, fontFamily: 'SegoeUI', color: Colors.black);

  static const boldBigWhiteTextStyle = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w700, fontFamily: 'SegoeUI', color: Colors.white);

  static const boldWhiteSmallTextStyle = TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w700, fontFamily: 'SegoeUI', color: Colors.white);

  static const boldBlackSmallTextStyle = TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w700, fontFamily: 'SegoeUI', color: Colors.black);

  static const blackTextStyle = TextStyle(
    color: Colors.black,
    fontFamily: 'SegoeUI',
    fontSize: 25.0,
    fontWeight: FontWeight.w900,
  );

  static const mediumTextStyle = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'SegoeUI',
    color: Colors.grey,
  );

  static const mediumWhiteTextStyle = TextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'SegoeUI',
    color: Colors.white,
  );

  static const mediumBlackkTextStyle = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'SegoeUI',
    color: Colors.black,
  );

  static var mediumRedTextStyle = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'SegoeUI',
    color:  createMaterialColor(Color(0xFFff735c)),
  );

  static const mediumBlackTextStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'SegoeUI',
    color: Colors.black,
  );

  static const mediumWhiteLargeTextStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'SegoeUI',
    color: Colors.white,
  );

  static const regularForSmallTextStyle =
  TextStyle( fontFamily: 'SegoeUI',fontWeight: FontWeight.w400,fontSize: 20.0,color: Colors.white);

  static const regularForBigWhiteTextStyle =
  TextStyle( fontFamily: 'SegoeUI',fontWeight: FontWeight.w400,fontSize: 15.0,color: Colors.black);

  static const regularForLargeTextStyle =
  TextStyle( fontFamily: 'SegoeUI',fontWeight: FontWeight.w400,fontSize: 20.0,color: Colors.black);

  static const boldColoredTextStyle = TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w700, fontFamily: 'SegoeUI', color: Colors.black);
}
