import 'package:flutter/material.dart';
import 'package:quran_karem/constants/colors.dart';
import 'package:quran_karem/di.dart';
import 'package:quran_karem/presentation/screens/all_drawer/drawer_screen.dart';
import 'package:quran_karem/presentation/widget/home/home_widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {



  @override
  void initState() {
    super.initState();
    homeCubit.animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    homeCubit.animator = CurvedAnimation(
      parent: homeCubit.animationController!,
      curve: Curves.easeInOutQuad,
      reverseCurve: Curves.easeInQuad,
    );
  }
@override
  void dispose() {
  homeCubit.animationController?.dispose();
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    homeCubit.screen = MediaQuery.of(context).size;
    homeCubit.maxSlide *= homeCubit.screen.width;
    homeCubit.extraHeight *= homeCubit.screen.height;
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onHorizontalDragStart:homeCubit.onDragStart,
        onHorizontalDragUpdate: homeCubit.onDragUpdate,
        onHorizontalDragEnd: homeCubit.onDragEnd,
        child: Stack(
          children: <Widget>[
            Container(color: darkGray),
            buildBackground(context),
          DrawerScreen(
              maxSlide:  homeCubit.maxSlide,
              extraHeight:  homeCubit.extraHeight,
              screen:  homeCubit.screen,
              animator:  homeCubit.animator),
            buildIconHeader(),
          ],
        ),
      ),
    );
  }


}
