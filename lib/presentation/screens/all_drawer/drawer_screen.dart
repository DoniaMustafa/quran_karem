import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_karem/constants/colors.dart';
import 'package:quran_karem/presentation/raout_app.dart';
import 'package:quran_karem/presentation/screens/all_drawer/condition_screen.dart';
import 'package:quran_karem/presentation/screens/all_drawer/contact_screen.dart';
import 'package:quran_karem/presentation/screens/list_and_details_juz/numbers_of_juz_screen.dart';
import 'package:quran_karem/presentation/screens/list_and_details_surah/surah_names_screen.dart';
import 'package:quran_karem/presentation/widget/defoult_button.dart';
import 'package:quran_karem/presentation/widget/header_inside_home_drawer_widget.dart';

class DrawerScreen extends StatelessWidget {
  double maxSlide = 0.75;
  dynamic extraHeight = 0.1;
  Size? screen;
  CurvedAnimation? animator;

  DrawerScreen(
      {required this.maxSlide,
      required this.extraHeight,
      required this.screen,
      required this.animator});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: -extraHeight - 30,
      bottom: -extraHeight,
      left: 0,
      right: screen!.width - (maxSlide + 50),
      child: AnimatedBuilder(
        animation: animator!,
        builder: (context, widget) {
          return Transform.translate(
            offset: Offset(maxSlide * (animator!.value - 1), 0),
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(pi * (1 - animator!.value) / 2),
              alignment: Alignment.centerRight,
              child: widget,
            ),
          );
        },
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              top: extraHeight + 30,
              bottom: extraHeight,
              child: SafeArea(
                child: Container(
                  width: maxSlide,
                  decoration: BoxDecoration(
                      color: lightGray,
                      image: DecorationImage(
                        image: AssetImage('assets/GUI/background.png'),
                        fit: BoxFit.fill,
                      )),
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 20.0,
                      left: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        headerWidget(),
                        SizedBox(
                          height: 50,
                        ),
                        DefaultButton(
                          text: '???????????? ???????????? ????',
                          padH: 25.0,
                          onPressed: () {
                            print('ok');
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => SurahNamesScreen()));                            // navigaTo(context: context,widget:  SurahNamesScreen());
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        DefaultButton(
                          text: '?????????? ???????????? ????????????',
                          padH: 25.0,
                          onPressed: () {
                            print('d');
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => NumbersOfJuzScreen()));

                                // navigaTo(context: context,widget: NumbersOfJuzScreen());
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        DefaultButton(
                          text: '?????????????? ??????????????',
                          padH: 25.0,
                          onPressed: () =>
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => ContactScreen())),
                              // navigaTo(context: context,widget: ContactScreen(
                          //     maxSlide: maxSlide,
                          //     extraHeight:  extraHeight,
                          //     screen: screen,
                          //     animator:animator
                          // )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        DefaultButton(
                          text: '?????????????? ??????????????',
                          padH: 25.0,
                          onPressed: () =>    Navigator.push(
                              context, MaterialPageRoute(builder: (context) => ConditionScreen())),
                          //     navigaTo(context: context,widget: ConditionScreen(
                          //     maxSlide: maxSlide,
                          //     extraHeight:  extraHeight,
                          //     screen: screen,
                          //     animator:animator
                          // )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // AnimatedBuilder(
            //   animation: animator!,
            //   builder: (_, __) => Container(
            //     width: maxSlide,
            //     color: Colors.black.withAlpha(
            //       (150 * (1 - animator!.value)).floor(),
            //     ),
            //   ),

            // ),
          ],
        ),
      ),
    );
  }
}
