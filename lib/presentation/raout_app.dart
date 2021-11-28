import 'package:flutter/material.dart';

void navigaTo({required context, required Widget widget})=>Navigator.push(
    context, MaterialPageRoute(builder: (context) => widget));


void navigateAndFinish({context, widget}) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
     builder: (context) => widget,
    ),
        (Route<dynamic> route) => false);

navigatorPop({@required context}) =>
    Navigator.pop(context);

