import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_karem/constants/colors.dart';
import 'package:quran_karem/constants/styel.dart';
import 'package:quran_karem/presentation/raout_app.dart';
import 'package:quran_karem/presentation/screens/all_drawer/drawer_screen.dart';
import 'package:quran_karem/presentation/screens/list_and_details_juz/numbers_of_juz_screen.dart';
import 'package:quran_karem/presentation/screens/list_and_details_audio/surah_audio_screen.dart';
import 'package:quran_karem/presentation/screens/list_and_details_surah/surah_names_screen.dart';
import 'package:quran_karem/presentation/widget/defoult_button.dart';
import 'package:quran_karem/presentation/widget/header_inside_home_drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var _maxSlide = 0.75;
  var _extraHeight = 0.1;
  double? _startingPos;
  var _drawerVisible = false;
  AnimationController? _animationController;
  Size _screen = Size(0, 0);
  CurvedAnimation? _animator;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _animator = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOutQuad,
      reverseCurve: Curves.easeInQuad,
    );
  }
@override
  void dispose() {
  _animationController?.dispose();
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    _screen = MediaQuery.of(context).size;
    _maxSlide *= _screen.width;
    _extraHeight *= _screen.height;
    super.didChangeDependencies();
  }

  void _onDragStart(DragStartDetails details) {
    _startingPos = details.globalPosition.dx;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final globalDelta = details.globalPosition.dx - _startingPos!;
    var pos;
    if (globalDelta > 0) {
       pos = globalDelta / _screen.width;
      if (_drawerVisible && pos <= 1.0) return;
      _animationController!.value = pos;
    } else {
       pos = 1 + (globalDelta / _screen.width);
      if (!_drawerVisible && pos >= 0.0) return;
      _animationController!.value = pos;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dx.abs() > 500) {
      if (details.velocity.pixelsPerSecond.dx > 0) {
        _animationController!.forward(from: _animationController!.value);
        _drawerVisible = true;
      } else {
        _animationController!.reverse(from: _animationController!.value);
        _drawerVisible = false;
      }
      return;
    }
    if (_animationController!.value > 0.5) {
      {
        _animationController!.forward(from: _animationController!.value);
        _drawerVisible = true;
      }
    } else {
      {
        _animationController!.reverse(from: _animationController!.value);
        _drawerVisible = false;
      }
    }
  }

  void _toggleDrawer() {
    if (_animationController!.value < 0.5)
      _animationController!.forward();
    else
      _animationController!.reverse();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        child: Stack(
          // clipBehavior: Clip.antiAlias,
          children: <Widget>[
            //Space color - it also makes the empty space touchable
            Container(color: darkGray),
            _buildBackground(),
          DrawerScreen(
              maxSlide: _maxSlide,
              extraHeight: _extraHeight,
              screen: _screen,
              animator: _animator),
            _buildIconHeader(),
          ],
        ),
      ),
    );
  }


  _buildBackground() => Positioned.fill(
        top: -_extraHeight + 10,
        bottom: -_extraHeight + 10,
        child: AnimatedBuilder(
          animation: _animator!,
          builder: (context, widget) => Transform.translate(
            offset: Offset((_maxSlide - 10) * _animator!.value, 0),
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY((pi / 2 + 0.1) * -_animator!.value),
              alignment: Alignment.center,
              child: widget,
            ),
          ),
          child: SafeArea(
            child: Container(
                alignment: Alignment.center,
                height: _extraHeight,
                margin: EdgeInsets.only(
                    top: _extraHeight - 10, bottom: _extraHeight - 10),
                decoration: BoxDecoration(
                    color: darkGray,
                    image: DecorationImage(
                      image: AssetImage('assets/GUI/background.png'),
                      fit: BoxFit.fill,
                    )),
                child: _buildHomeScreen()),
          ),
        ),
      );

  _buildHomeScreen() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          headerWidget(),
          _buildButton(context),
          _buildBottomPage()
        ],
      );
  _buildBottomPage() => Container(
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

  _buildButton(context) => Container(
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



  _buildIconHeader() => SafeArea(
        child: AnimatedBuilder(
            animation: _animator!,
            builder: (_, __) {
              return Transform.translate(
                offset: Offset((_screen.width - 75) * _animator!.value, 0),
                child: Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: SizedBox(
                    width: 100,
                    height: 50,
                    child: InkWell(
                      onTap: _toggleDrawer,
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
