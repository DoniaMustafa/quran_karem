import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationLoadingWidget extends StatefulWidget {

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<AnimationLoadingWidget> with SingleTickerProviderStateMixin{

  AnimationController? _controller ;
  Animation<double>? _animated;
@override
  void initState() {
  super.initState();

  _controller =AnimationController(
      vsync: this,
      duration: Duration(seconds: 3)
    )..repeat(reverse: true);
  _controller!.forward();
  _animated = CurvedAnimation(
      parent: _controller!,
      curve: Curves.bounceIn);

}
  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    _controller!.forward();
  return FadeTransition(opacity: _animated!,
      child:  Center(
        child: Image(image: AssetImage('assets/GUI/quran_karem.gif'),height: 250,
        width: 200,),
      ));
    //   TweenAnimationBuilder<Color>(
    //   duration:Duration(seconds: 2),
    //   child: Image(image: AssetImage('assets/GUI/quran_karem.gif'),),
    //   tween: Tween<Color>(begin: Color(0xff9C928DFF),end: Color(0xffA6A8B7CA)),
    //   builder: (BuildContext context,Color val, child)=>ColorFiltered(colorFilter: ColorFilter.mode(val, BlendMode.difference),child: child,)
    // );
  }
}
