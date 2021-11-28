import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quran_karem/constants/colors.dart';
import 'package:quran_karem/constants/styel.dart';
import 'package:quran_karem/di.dart';
import 'package:quran_karem/presentation/raout_app.dart';
import 'package:quran_karem/presentation/screens/all_drawer/drawer_screen.dart';
import 'package:quran_karem/presentation/screens/list_and_details_audio/surah_audio_screen.dart';
import 'package:quran_karem/presentation/screens/list_and_details_juz/numbers_of_juz_screen.dart';
import 'package:quran_karem/presentation/widget/defoult_button.dart';
import 'package:quran_karem/presentation/widget/header_inside_home_drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
    localHomeData.animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    localHomeData.animator = CurvedAnimation(
      parent: localHomeData.animationController!,
      curve: Curves.easeInOutQuad,
      reverseCurve: Curves.easeInQuad,
    );
  }

  @override
  void dispose() {
    localHomeData.animationController?.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    localHomeData.screen = MediaQuery.of(context).size;
    localHomeData.maxSlide *=  localHomeData.screen.width;
    localHomeData.extraHeight *=  localHomeData.screen.height;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Material(
        child: GestureDetector(
        onHorizontalDragStart:  localHomeData.onDragStart,
        onHorizontalDragUpdate: localHomeData.onDragUpdate,
        onHorizontalDragEnd: localHomeData.onDragEnd,
        child: Stack(
          children: <Widget>[
            Container(color: darkGray),
            buildBackground(context),
            DrawerScreen(
                maxSlide:  localHomeData.maxSlide,
                extraHeight:  localHomeData.extraHeight,
                screen:  localHomeData.screen,
                animator: localHomeData.animator),
            buildIconHeader(),
          ],
        ),
      ),
    );
  }


  buildBackground(context) => Positioned.fill(
    top: -  localHomeData.extraHeight + 10,
    bottom: - localHomeData.extraHeight + 10,
    child: AnimatedBuilder(
      animation:  localHomeData.animator!,
      builder: (context, widget) => Transform.translate(
        offset: Offset((  localHomeData.maxSlide - 10) *   localHomeData.animator!.value, 0),
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY((pi / 2 + 0.1) * - localHomeData.animator!.value),
          alignment: Alignment.center,
          child: widget,
        ),
      ),
      child: SafeArea(
        child: Container(
            alignment: Alignment.center,
            height:  localHomeData.extraHeight,
            margin: EdgeInsets.only(
                top:  localHomeData.extraHeight - 10, bottom:  localHomeData.extraHeight - 10),
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
            navigaTo(context: context,widget: SurahAudioScreen());
          },
        ),
        SizedBox(
          height: 15.0,
        ),
        DefaultButton(
          padH:70.0 ,
          text: 'القران الكريم نص',
          onPressed: () => pushNamed(context, '/home')
        ),
        SizedBox(
          height: 15.0,
        ),
        DefaultButton(
          padH:70.0 ,
          text: 'اجزاء القران الكريم',
          onPressed: () => navigaTo(context: context,widget: NumbersOfJuzScreen()),
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    ),
  );
  buildIconHeader() => SafeArea(
    child: AnimatedBuilder(
        animation:  localHomeData.animator!,
        builder: (_, __) {
          return Transform.translate(
            offset: Offset(( localHomeData.screen.width - 75) *  localHomeData.animator!.value, 0),
            child: Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: SizedBox(
                width: 100,
                height: 50,
                child: InkWell(
                  onTap:  localHomeData.toggleDrawer,
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


}
