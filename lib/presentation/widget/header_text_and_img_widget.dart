import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quran_karem/constants/colors.dart';
import 'package:quran_karem/constants/styel.dart';

class HeaderImageAndTextWidget extends StatelessWidget {
 final String title;
  bool isShow=false;
 HeaderImageAndTextWidget({ required this.title,required this.isShow});

 @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 100,
      child: Row(
        children: [
          GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios)),
     if(isShow == true)
          Expanded(
            flex: 2,
            child: Container(
              // width: 150,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/GUI/quran_karem.gif'),
                  )),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    title ,
                    textStyle: white25bold(),
                    colors: colorizeColors,
                  ),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
