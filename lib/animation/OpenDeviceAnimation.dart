// /
// @Author:      Amuser
// @CreateDate:   2019-11-1 9:06
//@Description:
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_lottie/flutter_lottie.dart';

typedef void LoadingStart();
typedef void LoadingFinish();

class OpenDeviceAnimation extends StatefulWidget {

  LoadingStart _loadingStart;
  LoadingFinish _loadingFinish;
  OpenDeviceAnimation();

  _OpenDeviceAnimation createState() => _OpenDeviceAnimation();
}

class _OpenDeviceAnimation extends State<OpenDeviceAnimation> with SingleTickerProviderStateMixin {
  LottieController controller;
  double _opacityStart = 0.0;
  double _opacityEnd=0.0;
  Matrix4 _transStart;
  Matrix4 _transEnd;
  double _width = 120;
  double _height = 42;
  Widget _openAnimationWidget;
  double _mainContainer=1.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _transStart = Matrix4.translationValues(0, 0, 0);
    _transEnd= Matrix4.translationValues(0, 0, 0);
    _openAnimationWidget=_openText();
  }


  void _onTransStart() {
    setState(() {
      _width = 42;
      _height = 42;
      _openAnimationWidget=_getLoading();
      _transStart = Matrix4.translationValues(-55, 0, 0);
      _opacityStart=1.0;
      widget._loadingStart;
    });
    Timer(Duration(milliseconds: 5000), (){
      _onTransEnd();
    });
  }

  void _onTransEnd() {
    setState(() {
      _openAnimationWidget=_loadingFinish();
      _opacityStart=0.0;
      _transEnd = Matrix4.translationValues(-55, 0, 0);
      _opacityEnd=1.0;
      Timer(Duration(seconds: 1), () {
        setState(() {
          _mainContainer=0.0;
        });
      });
    });
  }

  ///请求失败还原
  void _onTransReturn() {
    setState(() {
      print("===难道没进来？？");
      _width = 120;
      _height = 42;
      _openAnimationWidget=_openText();
      _transStart = Matrix4.translationValues(0, 0, 0);
      _opacityStart=0.0;
//      widget._loadingStart;
    });
  }

  @override
  Widget build(BuildContext context) {

    return  Column(
      children: <Widget>[
        _getBody(),
        FlatButton(onPressed: (){
          _onTransReturn();
        }, child: Text("就看你的了"))
      ],
    );
  }


  Widget  _getBody(){
    return  _mainContainer==0.0?Container(): Container(
      alignment: Alignment.center,
      height: 60,
      margin: EdgeInsets.only(left: 20, right: 20),
      padding: EdgeInsets.only(left: 25, right: 15),
      child: AnimatedOpacity(opacity:_mainContainer, duration: Duration(milliseconds: 500),
        child:Row(
          children: <Widget>[
            new Expanded(
                child: _moveWidget()),
            GestureDetector(
              onTap: _onTransStart,
              child: _openPower(),
            ),
          ],
        ) ,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }


  Widget _transStartWidget() {
    return AnimatedContainer(
      padding: EdgeInsets.only(left: 55),
      duration: Duration(milliseconds:500),
      transform: _transStart,
      child:AnimatedOpacity(opacity: _opacityStart, duration: Duration(milliseconds:500),
        child: _opacityStart==0.0?Container():_getText("正在开启所有设备的省电功能哦"),
      ),
    );
  }

  Widget _transEndWidget() {
    return AnimatedContainer(
      padding: EdgeInsets.only(left: 55),
      duration: Duration(milliseconds: 359),
      transform: _transEnd,
      child:AnimatedOpacity(opacity: _opacityEnd, duration: Duration(milliseconds: 29),
        child: _getText("已开启"),
      ),
    );
  }




  Widget _intiText(){

   return AnimatedOpacity(opacity: _opacityStart==1.0 || _opacityEnd==1.0?0.0:1.0, duration: Duration(milliseconds: 29),
   child:Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     mainAxisAlignment: MainAxisAlignment.center,
     children: <Widget>[
       Text('开启所有设备的省电功能', style: TextStyle(fontSize: 14, color: Color(0xFF333333), fontWeight: FontWeight.w600)),
       RichText(
         text: TextSpan(
           children: <TextSpan>[
             TextSpan(text: '预计可省电', style: TextStyle(fontSize: 12, color: Color(0xFF666666))),
             TextSpan(text: '15', style: TextStyle(fontSize: 18, color: Color(0xFF666666))),
             TextSpan(text: '度/日', style: TextStyle(fontSize: 9, color: Color(0xFF666666))),
           ],
         ),
       )
     ],
   ) ,
   );


  }


  Widget _moveWidget() {
    return Stack(
        children: <Widget>[
          _intiText(),
          GestureDetector(child:_transStartWidget(),
          onTap: (){
            _onTransEnd();
          },
          ),
          _transEndWidget(),
        ],
    );
  }

  Widget _getText(String content) {
    return  Align(
      alignment: Alignment.centerLeft,
      child: Text(
        content,
        style: TextStyle(fontSize: 14, color: Color(0xFF333333), fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _openPower(){
    return Container(
      width: _width,
      height: _height,
      alignment: Alignment.center,
      child:_openAnimationWidget,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0x330BC497), Color(0xFF1EE6A5)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }


  Widget _getLoading(){
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>( Color(0xFFFFFFFF)),
      strokeWidth: 3.0,
    );
  }


  Widget _openText(){
    return Text('一键开启', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600));
  }

  Widget _loadingFinish(){
    return  Container(
      width: 50,
      height:50,
      child: LottieView.fromFile(
        filePath: 'assets/load_ok.json',
        autoPlay: true,
        loop: false,
        reverse: false,
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  void onViewCreated(LottieController controller) {
    this.controller = controller;

    // Listen for when the playback completes
//    controller.setAnimationProgress(1.0);
    controller.setLoopAnimation(false);
    this.controller.onPlayFinished.listen((bool animationFinished) {
      print("Playback complete. Was Animation Finished? " + animationFinished.toString());
    });
  }
}
