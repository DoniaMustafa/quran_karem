import 'package:flutter/material.dart';

void navigaTo(BuildContext context,Widget widget)=>Navigator.push(context,MaterialPageRoute(builder: (builder)=>widget));
void navigaAndFinished(BuildContext context,Widget widget)=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>widget), (route) => false);
