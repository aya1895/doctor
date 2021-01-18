import 'package:flutter/material.dart';

class textStyle extends TextStyle
{
  FontWeight fw;
  double size;
TextStyle txtStyle;
Color color;
static const c=Color(0xff363636);

  textStyle(this.fw, this.size,[this.color= c])
  {
    txtStyle=TextStyle(
        color: color, fontSize: size,fontWeight: fw);
  }



}