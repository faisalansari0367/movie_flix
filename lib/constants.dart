import 'package:flutter/material.dart';

const kInputRadius = 50.0;
const kRadius = Radius.circular(12);
const kBorderRadius = BorderRadius.all(kRadius);

const kPhysics = BouncingScrollPhysics();
const kCurve = Curves.fastOutSlowIn;
const kMargin = EdgeInsets.all(10);
const kSplashDuration = Duration(milliseconds: 2000);
const kDuration = Duration(milliseconds: 500);
const kBorderSide = BorderSide(color: Colors.transparent);
final kInputBorderRadius = BorderRadius.circular(kInputRadius);
final kInputBorder = OutlineInputBorder(
  borderRadius: kInputBorderRadius,
  borderSide: kBorderSide,
);
