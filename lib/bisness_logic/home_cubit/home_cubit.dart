import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quran_karem/bisness_logic/home_cubit/home_state.dart';

class LocalHomeData  {
  double? startingPos;
  double maxSlide = 0.75;
  double extraHeight = 0.1;
  bool drawerVisible = false;
  Size screen = Size(0, 0);
  AnimationController? animationController;
  CurvedAnimation? animator;


  void onDragStart(DragStartDetails details) {
    startingPos = details.globalPosition.dx;

  }
  void onDragUpdate(DragUpdateDetails details) {
    final globalDelta = details.globalPosition.dx - startingPos!;
    var pos;
    if (globalDelta > 0) {
      pos = globalDelta / screen.width;
      if (drawerVisible && pos <= 1.0) return;
      animationController!.value = pos;
    } else {
      pos = 1 + (globalDelta / screen.width);
      if (!drawerVisible && pos >= 0.0) return;
      animationController!.value = pos;
    }
  }

  void onDragEnd(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dx.abs() > 500) {
      if (details.velocity.pixelsPerSecond.dx > 0) {
        animationController!.forward(from: animationController!.value);
        drawerVisible = true;
      } else {
        animationController!.reverse(from: animationController!.value);
        drawerVisible = false;
      }
      return;
    }
    if (animationController!.value > 0.5) {
      {
        animationController!.forward(from: animationController!.value);
        drawerVisible = true;
      }
    } else {
      {
        animationController!.reverse(from: animationController!.value);
        drawerVisible = false;
      }
    }
  }

  void toggleDrawer() {
    if (animationController!.value < 0.5)
      animationController!.forward();
    else
      animationController!.reverse();

  }




}
