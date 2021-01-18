import 'package:doctor/styles/colors.dart';
import 'package:doctor/styles/homeSizes.dart';
import 'package:flutter/cupertino.dart';

class textStyle2
{
  TextStyle textStyle;

  textStyle2()
  {
    textStyle=TextStyle(
        color: myColors.txt2,
        fontSize: homeSizes.txtBody,
        decoration: TextDecoration.underline);
  }
}