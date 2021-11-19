import 'package:flutter/cupertino.dart';

customFrame({required Widget child})=>Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/GUI/background.png'),
      fit: BoxFit.fill,
    ),
  ),
  padding: EdgeInsets.only(top: 20, bottom: 30),
child: child,
);