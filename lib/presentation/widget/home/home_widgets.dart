import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quran_karem/constants/colors.dart';
import 'package:quran_karem/constants/styel.dart';
import 'package:quran_karem/di.dart';
import 'package:quran_karem/presentation/raout_app.dart';
import 'package:quran_karem/presentation/screens/list_and_details_audio/surah_audio_screen.dart';
import 'package:quran_karem/presentation/screens/list_and_details_juz/numbers_of_juz_screen.dart';
import 'package:quran_karem/presentation/screens/list_and_details_surah/surah_names_screen.dart';
import 'package:quran_karem/presentation/widget/defoult_button.dart';
import 'package:quran_karem/presentation/widget/header_inside_home_drawer_widget.dart';

buildBackground(context) => Positioned.fill(
  top: - homeCubit.extraHeight + 10,
  bottom: - homeCubit.extraHeight + 10,
  child: AnimatedBuilder(
    animation:  homeCubit.animator!,
    builder: (context, widget) => Transform.translate(
      offset: Offset(( homeCubit.maxSlide - 10) *  homeCubit.animator!.value, 0),
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY((pi / 2 + 0.1) * -homeCubit.animator!.value),
        alignment: Alignment.center,
        child: widget,
      ),
    ),
    child: SafeArea(
      child: Container(
          alignment: Alignment.center,
          height: homeCubit.extraHeight,
          margin: EdgeInsets.only(
              top: homeCubit.extraHeight - 10, bottom: homeCubit.extraHeight - 10),
          decoration: BoxDecoration(
              color: darkGray,
              image: DecorationImage(
                image: AssetImage('assets/GUI/background.png'),
                fit: BoxFit.fill,
              )),
          child: buildHomeScreen(context)),
    ),
  ),
);

buildHomeScreen(context) => Column(

  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: <Widget>[
    headerWidget(),
    buildButton(context),
    buildBottomPage()
  ],
);
buildBottomPage() => Container(
    child: Column(
      children: [
        RichText(
            text: TextSpan(
                text:
                '﴾ إِنَّا نَحْنُ نَزَّلْنَا الذِّكْرَ وَإِنَّا لَهُ لَحَافِظُونَ ﴿',
                style: white20bold())),
        RichText(text: TextSpan(text: 'سورة الحج', style: white18bold())),
      ],
    ));

buildButton(context) => Container(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      DefaultButton(
        padH:70.0 ,
        text: 'القران الكريم صوت',
        onPressed: () {
          print('de');
          navigaTo(context, SurahAudioScreen());
        },
      ),
      SizedBox(
        height: 15.0,
      ),
      DefaultButton(
        padH:70.0 ,
        text: 'القران الكريم نص',
        onPressed: () => navigaTo(context, SurahNamesScreen()),
      ),
      SizedBox(
        height: 15.0,
      ),
      DefaultButton(
        padH:70.0 ,
        text: 'اجزاء القران الكريم',
        onPressed: () => navigaTo(context, NumbersOfJuzScreen()),
      ),
      SizedBox(
        height: 15.0,
      ),
    ],
  ),
);



buildIconHeader() => SafeArea(
  child: AnimatedBuilder(
      animation: homeCubit.animator!,
      builder: (_, __) {
        return Transform.translate(
          offset: Offset((homeCubit.screen.width - 75) * homeCubit.animator!.value, 0),
          child: Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: SizedBox(
              width: 100,
              height: 50,
              child: InkWell(
                onTap: homeCubit.toggleDrawer,
                child: Icon(
                  Icons.menu,
                  color: white,
                  size: 35,
                ),
              ),
            ),
          ),
        );
      }),
);
