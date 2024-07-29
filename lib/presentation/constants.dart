import 'package:flutter/material.dart';

//Colors
const Color kMainAppColor = Color(0xFF1463F5);
const Color kAppBarTextColor = Color(0xFF211814);
const Color kPlaceholderTextColor = Color(0xFFBFBFBF);

//TextStyle
TextStyle kAppBarTextStyle = const TextStyle(
    color: kAppBarTextColor,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w600,
    fontSize: 16);

TextStyle kItemTextStyle = const TextStyle(
    color: kAppBarTextColor,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w400,
    fontSize: 14);

TextStyle kPlaceholderTextStyle = const TextStyle(
  fontFamily: 'Raleway',
  color: kPlaceholderTextColor,
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
);

TextStyle kPlaceholderScreenTextStyle = const TextStyle(
  fontFamily: 'Raleway',
  color: kPlaceholderTextColor,
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
  height: 1.4,
);
