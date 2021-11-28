import 'package:flutter/material.dart';
import 'package:quran_karem/constants/styel.dart';
import 'package:quran_karem/presentation/raout_app.dart';
import 'package:quran_karem/presentation/screens/all_drawer/drawer_screen.dart';
import 'package:quran_karem/presentation/widget/frame_widget.dart';

class ContactScreen extends StatelessWidget {
  double maxSlide = 0.75;
  dynamic extraHeight = 0.1;
  Size? screen;
  CurvedAnimation? animator;

  ContactScreen(
      {required this.maxSlide,
        required this.extraHeight,
        required this.screen,
        required this.animator});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: customFrame(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  padding: EdgeInsets.only(top: 40.0, left: 30.0),
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                      onTap: ()=>navigaTo(context,DrawerScreen(maxSlide: maxSlide, extraHeight: extraHeight, screen: screen, animator: animator)),
                      child: Icon(Icons.arrow_back_ios_outlined))),
              SizedBox(
                height: 75,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'للتواصل',
                  style: white22bold(),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 75,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: white20regular(),
                      text:
                          'If you have any questions, feedback, concerns or queries, please write to support@islamic.network or join the Islamic Network Discord server @ https://discord.gg/FwUy69M.'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
