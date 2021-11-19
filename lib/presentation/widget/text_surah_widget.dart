import 'package:flutter/cupertino.dart';
import 'package:quran_karem/constants/styel.dart';

class SurahContentWidget extends StatelessWidget {
final List data;
 String? _text;
 bool? _sajda;
 int? _numberInSurah;
SurahContentWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  RichText(
      text: TextSpan(
          children:
          data.map(
                (e) => TextSpan(
                style: white22bold(),
                text:
                '${e._text} ${e._sajda == true ? '۩' : ''} ﴿${e._numberInSurah}﴾'),
          )
              .toList()),
    );
  }


}
