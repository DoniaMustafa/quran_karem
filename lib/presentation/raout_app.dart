import 'package:flutter/material.dart';
import 'package:quran_karem/presentation/screens/home_screen.dart';
import 'package:quran_karem/presentation/screens/list_and_details_surah/surah_names_screen.dart';

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


void pushNamed(context,String screen)=>
Navigator.pushNamed(context, screen);

class Routes{

  Map<String, WidgetBuilder> routes = {
    '/home':(context)=>SurahNamesScreen(),

  };

}