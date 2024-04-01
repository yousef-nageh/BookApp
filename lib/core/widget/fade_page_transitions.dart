import 'package:flutter/cupertino.dart';

class FadePageTransition extends PageRouteBuilder{
  final Widget screen;


  FadePageTransition({required this.screen}) :super(
      pageBuilder: (context,animation,secondaryAnimation)=>screen,

      transitionsBuilder: (context,animation,secondaryAnimation,child){

        var myAnimation=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: animation, curve: Curves.fastEaseInToSlowEaseOut));
        return RotationTransition(turns: myAnimation,
          child: child,);
      }
  );
}