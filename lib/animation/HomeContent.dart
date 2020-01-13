// /
// @Author:      Amuser
// @CreateDate:   2019-11-1 17:54
//@Description:
import 'package:flutter/material.dart';

///
class HomeContent extends StatefulWidget {
  HomeContent({Key key}) : super(key: key);

  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  double _opacity = 0.0;
  Widget _widget;
  Matrix4 _transform = Matrix4.translationValues(0, 0, 0);
  Matrix4 _transMove;
  bool isTrue = false;
  double _iconOpacity = 0.0;

  void _onTapHandle() {
    setState(() {
      isTrue = false;
      print("=====进来了" + _opacity.toString());
      _iconOpacity = 1.0;
      _transform = Matrix4.translationValues(0, -50, 0);
      _opacity = 1.0;
//      _opacity = _opacity == 1.0 ? 0.0 : 1.0;
//      _transform = _opacity == 0.0 ? Matrix4.translationValues(-300, 0, 0) : Matrix4.translationValues(0, 0, 0);
    });
  }

  void _onLeftHandle() {
    setState(() {
      isTrue = true;
      print("=====left进来了" + _opacity.toString());

      _transMove = Matrix4.translationValues(-55, 0, 0);
      _opacity = 1.0;
//      _opacity = _opacity == 1.0 ? 0.0 : 1.0;
//      _transform = _opacity == 0.0 ? Matrix4.translationValues(-300, 0, 0) : Matrix4.translationValues(0, 0, 0);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _transMove = Matrix4.translationValues(0, 0, 0);
    _widget = _getMoveText("正在开启所有设备的省电功能哦");
  }

  @override
  Widget build(BuildContext context) {
    return homeWidget();
  }

  Widget bodyWidget() {
    return Stack(
      children: <Widget>[
        Center(
          child: Column(
            children: <Widget>[
              _moveWidget(),

//              AnimatedContainer(
//                duration: Duration(milliseconds: 500),
//                transform: _transform,
//                child: AnimatedOpacity(
//                  opacity: _opacity,
//                  duration: Duration(milliseconds: 500),
//                  child: _getText(),
////                  Container(
////                    alignment: Alignment.center,
////                    width: 100,
////                    height: 50,
////                    color: Colors.pink,
////                  ),
//                ),
//              ),
              SizedBox(height: 10),
              Offstage(
                offstage: isTrue,
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 150,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                width: 100,
                height: 50,
                color: Colors.blue,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 1,
          right: 1,
          child: InkWell(
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
            onTap: _onTapHandle,
          ),
        ),
        Positioned(
          bottom: 1,
          left: 1,
          child: InkWell(
            child:Container(
              width: 50,
              height: 50,
              padding: EdgeInsets.only(bottom: 55),
              margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.pink,
              ),
              child: AnimatedContainer(
                margin: EdgeInsets.only(top: 55),
                duration: Duration(milliseconds:500),
                transform: _transform,
                child: AnimatedOpacity(
                  opacity: _iconOpacity,
                  duration: Duration(seconds:2),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
            onTap: _onLeftHandle,
          ),
        )
      ],
    );
  }

  Widget homeWidget() {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnimatedOpacity Widget'),
          backgroundColor: Colors.pink,
        ),
        body: bodyWidget(),
      ),
    );
  }

  Widget _getText() {
    return Text(
      "正在开启所有设备的省电功能哦",
      style: TextStyle(fontSize: 14, color: Color(0xFF333333), fontWeight: FontWeight.w600),
    );
  }

  Widget _getMoveText(String content) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      transform: _transform,
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(milliseconds: 500),
        child: Text(
          content,
          style: TextStyle(fontSize: 14, color: Color(0xFF333333), fontWeight: FontWeight.w600),
        ),
//                  Container(
//                    alignment: Alignment.center,
//                    width: 100,
//                    height: 50,
//                    color: Colors.pink,
//                  ),
      ),
    );
  }

  Widget _moveWidget() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 359),
      transform: _transMove,
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(milliseconds: 29),
        child: _getText(),
      ),
    );
  }
}
