import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_karem/constants/colors.dart';
import 'package:quran_karem/constants/const.dart';
import 'package:quran_karem/constants/styel.dart';
import 'package:quran_karem/presentation/raout_app.dart';
import 'package:quran_karem/presentation/screens/list_and_details_juz/juz_details_screen.dart';
import 'package:quran_karem/presentation/widget/frame_widget.dart';
import 'package:quran_karem/presentation/widget/header_text_and_img_widget.dart';

class NumbersOfJuzScreen extends StatelessWidget {


  Widget buildListItem(context) => Expanded(
    child: AspectRatio(
          aspectRatio: 1.0 / 1.9,
          child: ListView.separated(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, i) => InkWell(
                onTap: () => navigaTo(
                    context,
                    JuzDetailScreen(
                      id: i + 1,
                      juzNumber: numbersOfJuz[i].toString(),
                    )),
                child: buildNumbersOfJuzItem(numbersOfJuz[i])),
            separatorBuilder: (context, i) => Divider(
              color: divColor,
            ),
            itemCount: numbersOfJuz.length,
          ),
        ),
  );
  Widget buildNumbersOfJuzItem(numbersOfJuz) => Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Text(
        '$numbersOfJuz',
        style: white20regular(),
        textAlign: TextAlign.center,
      ));
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: customFrame(
              child: Column(
                children: [
                  HeaderImageAndTextWidget(title:  'اجزاء القران الكريم',isShow: true,),
                  buildListItem(context),
                ],
              )),
        ),
      ),
    );
  }
}
