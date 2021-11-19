import 'package:flutter/cupertino.dart';
import 'package:quran_karem/constants/styel.dart';
import 'package:quran_karem/presentation/widget/circle.dart';

class ItemOfListWidget extends StatelessWidget {
  final String? txt;
  final String? numberTxt;
  const ItemOfListWidget({required this.txt, required this.numberTxt, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        circle(data: numberTxt),
        SizedBox(
          width: 20.0,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: txt,
            style: white22regular(),
          ),
        ),
      ],
    );
  }
}
