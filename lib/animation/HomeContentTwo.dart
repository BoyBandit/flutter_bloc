// /   
// @Author:      Amuser
// @CreateDate:   2019-11-1 18:23
//@Description: 
import 'dart:math';

import 'package:flutter/material.dart';

///
///
//class TestAnimationTwo extends StatelessWidget {
//
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('AnimatedContainer Widget'),
//          backgroundColor: Colors.pink,
//        ),
//        body: HomeContent(),
//      ),
//    );
//  }
//}

class HomeContentTwo extends StatefulWidget {
  HomeContentTwo({Key key}) : super(key: key);

  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContentTwo> {
  double _width = 120;
  double _height = 60;
  Color _color = Colors.pink;
  Matrix4 _transform = null;
  BorderRadius _borderRadius = BorderRadius.circular(8);


  Widget _animationWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationWidget=_getText();
  }

  void onTapHandle() {
    Random random = new Random();
    setState(() {
      _width = 48;
      _height = 48;

      _animationWidget=_getLoading();

      _borderRadius = BorderRadius.circular(99);
      _color = Color.fromARGB(
          255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
      _transform = Matrix4.translationValues(22.2,
          22.2, 22.2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: AnimatedContainer(
            width: _width,
            height: _height,
            alignment: Alignment.center,
            child:_animationWidget,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              gradient: LinearGradient(colors:[Color(0xFF666666), Color(0xFF6CE68D)]),
            ),
            transform: _transform,
            duration: Duration(
              milliseconds: 500,
            ),
          ),
        ),
        Positioned(
          bottom: 1,
          right: 1,
          child: GestureDetector(
            child: Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.pink,
              ),
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
            onTap: onTapHandle,
          ),
        )
      ],
    );
  }

  Widget _getText(){
    return GestureDetector(
      child: Text('一键开启', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600)),
      onTap:onTapHandle,
    );
  }



  Widget _getLoading(){
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>( Color(0xFFFFFFFF)),
      strokeWidth: 3.0,
    );
  }


}






//class _HomeContentState extends State<HomeContent> {
//  double _width = 60;
//  double _height = 60;
//  Color _color = Colors.pink;
//  Matrix4 _transform = null;
//  BorderRadius _borderRadius = BorderRadius.circular(8);
//
//  void _onTapHandle() {
//    Random random = new Random();
//    setState(() {
//      _width = random.nextInt(300).toDouble();
//      _height = random.nextInt(300).toDouble();
//      _borderRadius = BorderRadius.circular(random.nextInt(300).toDouble());
//      _color = Color.fromARGB(
//          255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
//      _transform = Matrix4.translationValues(random.nextInt(50).toDouble(),
//          random.nextInt(50).toDouble(), random.nextInt(50).toDouble());
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Stack(
//      children: <Widget>[
//        Center(
//          child: AnimatedContainer(
//            width: _width,
//            height: _height,
//            decoration: BoxDecoration(
//              borderRadius: _borderRadius,
//              color: _color,
//            ),
//            transform: _transform,
//            duration: Duration(
//              milliseconds: 500,
//            ),
//          ),
//        ),
//        Positioned(
//          bottom: 1,
//          right: 1,
//          child: GestureDetector(
//            child: Container(
//              width: 50,
//              height: 50,
//              margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(50),
//                color: Colors.pink,
//              ),
//              child: Icon(
//                Icons.play_arrow,
//                color: Colors.white,
//              ),
//            ),
//            onTap: _onTapHandle,
//          ),
//        )
//      ],
//    );
//  }
//}