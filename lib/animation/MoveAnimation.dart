// /   
// @Author:      Amuser
// @CreateDate:   2019-11-4 16:33
//@Description: 
import 'package:flutter/material.dart';

///
class MoveAnimation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MoveAnimation();
  }

}

class _MoveAnimation extends State<MoveAnimation>{
  double _opacity = 0.0;
  double _opacityTwo=0.0;
  Matrix4 _transform;
  Matrix4 _transMove;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _transform = Matrix4.translationValues(0, 0, 0);
    _transMove= Matrix4.translationValues(0, 0, 0);
  }


  void _onTapHandle() {
    setState(() {
      _transMove = Matrix4.translationValues(-55, 0, 0);
      _opacity=1.0;
    });
  }

  void _onLeftHandle() {
    setState(() {
      _opacity=0.0;
      _transform = Matrix4.translationValues(-55, 0, 0);
      _opacityTwo=1.0;
    });
  }

  Widget _moveWidget() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 299),
      transform: _transMove,
      child:AnimatedOpacity(opacity: _opacity, duration: Duration(milliseconds: 29),
        child: _getText("正在开启所有设备的省电功能哦"),
      ),
    );
  }

  Widget _moveWidgetTwo() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 359),
      transform: _transform,
      child:AnimatedOpacity(opacity: _opacityTwo, duration: Duration(milliseconds: 29),
        child: _getText("已开启"),
      ),
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("移动动画"),
      ),
      body: _getBodyWidget(),
    );
  }



//  Container(
//  child:  _moveWidget(),
//  ),
//  Container(child: _moveWidgetTwo(),),

  Widget _getBodyWidget(){
    return Container(
      color: Colors.white,
      height: 65,
      padding: EdgeInsets.only(left:61),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                _moveWidget(),
                _moveWidgetTwo(),
              ],
            ),
          ),
          FlatButton(onPressed: _onTapHandle, child: Text("start",style: TextStyle(fontSize: 14, color: Color(0xFF333333), fontWeight: FontWeight.w600))),
          FlatButton(onPressed: _onLeftHandle, child: Text("next",style: TextStyle(fontSize: 14, color: Color(0xFF333333), fontWeight: FontWeight.w600)))
        ],
      ),
    );
  }

}