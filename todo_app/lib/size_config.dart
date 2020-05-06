import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData queryData;
  static double hori;
  static double verti;
  static double pxr;

  void init(BuildContext context) {
    queryData = MediaQuery.of(context);
    hori = queryData.size.width/100;
    verti = queryData.size.height/100;
    pxr = queryData.devicePixelRatio;
  }
}