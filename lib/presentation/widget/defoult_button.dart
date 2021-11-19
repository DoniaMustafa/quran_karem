import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_karem/constants/colors.dart';
import 'package:quran_karem/constants/styel.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final double padH;
  DefaultButton({required this.text,
    required this.padH, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: padH),
        child: ElevatedButton(child: Container(
          alignment: Alignment.center,
            // padding:  EdgeInsets.symmetric(horizontal: 50.0),
            child: Text(text,style: white22regular(),textAlign: TextAlign.center,),
          ),

          onPressed: () => onPressed!(),
          style: ElevatedButton.styleFrom(
            // textStyle:white18bold(),
            primary: lightBrown,alignment: Alignment.centerRight,
            minimumSize: Size(double.infinity, 50.0),
          ),
        ),
      ),
    );
  }
}
