import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;


///
/// @Author:      Amuser
/// @CreateDate:   2019-12-16 8:37
///@Description: 自定义完成动画
///
///

class TestCustomPoint extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoadingOk();
  }
}

class _LoadingOk extends State<TestCustomPoint> with SingleTickerProviderStateMixin {
  Animation<double> _doubleAnimation;
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 522));
    _doubleAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _controller.addListener(() {
      this.setState(() {});
    });
    _controller.addStatusListener((state){
      print("动画执行${state.index}=======${_doubleAnimation.value}");
    });
    onAnimationStart();
  }

  void onAnimationStart() {
    _controller.forward(from: 0.0);
  }

  @override
  void reassemble() {
    super.reassemble();
    onAnimationStart();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("来个完成动画"),
          centerTitle: true,
        ),

        body: Column(
          children: <Widget>[
            GestureDetector(
              child: Text("我丢",style: TextStyle(fontSize: 46),),
              onTap: (){
                onAnimationStart();
              },
            ),
            GestureDetector(
              child: Text("丢又丢",style: TextStyle(fontSize: 46),),
              onTap: (){
                _controller.reset();
              },
            ),
            FlatButton(onPressed: (){
              onAnimationStart();
            }, child: Text("开始动画")),
            FlatButton(onPressed: (){
              _controller.reset();
            }, child: Text("继续执行")),
            Container(
             margin: EdgeInsets.only(left: 12),
              child: CustomPaint(
                painter: FinishPainter(_controller.value),
                child: Center(child: Text((_doubleAnimation.value / 0.1).round().toString(),style: TextStyle(color: Color(0x00000000)),),),
              ),
            )
          ],
        )
    );
  }


  Widget _getPaint(){
    return  Container(
      margin: EdgeInsets.only(left: 12),
      child: CustomPaint(
        painter: FinishPainter(_controller.value),
        child: Center(child: Text((_doubleAnimation.value / 0.1).round().toString(),style: TextStyle(color: Color(0x00000000)),),),
      ),
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return (Scaffold(
//      appBar: AppBar(
//        title: Text('自定义View'),
//      ),
//      body: Container(
//        width: 100.0,
//        height: 100.0,
//        margin: EdgeInsets.all(8.0),
//        child: CustomPaint(
//          /* child: Align(
//                alignment: Alignment.topLeft,
//                child: Transform.rotate(
//                  angle: -3.1415926 / 4,
//                  child: Text('Hot'),
//                  origin: Offset(100.0 / 2, 0.0),
//                )),*/
//            child: Center(
//                child: Text((_doubleAnimation.value / 0.1).round().toString())),
//            painter: FinishPainter(_doubleAnimation.value)
//          /*LabelViewPainter(
//            labelColor: Colors.redAccent,
//            labelAlignment: LabelAlignment.leftTop,
//            useAngle: true,
//          ),*/
//        ),
//      ),
//    ));
//  }

}



///新建类继承于CustomPainter并且实现CustomPainter里面的paint（）和shouldRepaint方法
class FinishPainter extends CustomPainter {
  double value;
  Paint _paint;

  FinishPainter(this.value) {
//    this.value=_value;
//    print("我丢=====$value");
    _paint = new Paint()
      ..color = Colors.green
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;
  }

  ///Flutter中负责View绘制的地方，使用传递来的canvas和size即可完成对目标View的绘制
  @override
  void paint(Canvas canvas, Size size) {
    //绘制直线
    //canvas.drawLine(Offset(20.0, 20.0), Offset(120.0, 20.0), _paint);
    print("为什么不一样=====$value");
    canvas.drawLine(Offset(0.0, 0.0), Offset(5.0*getAnimateValue(), 5.0*getAnimateValue()), _paint);
    canvas.drawLine(Offset(5.0*getAnimateValue(), 5.0*getAnimateValue()), Offset(15.0*getAnimateValue(), -5*getAnimateValue()), _paint);
  }



  double getAnimateValue(){
    return value;
//    print("为什么不一样=====$_value");
//    if(_value>=0.1){
//      return _value;
//    }
//   return value *10;
  }
  ///控制自定义View是否需要重绘的，返回false代表这个View在构建完成后不需要重绘。
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


class CirclePainter extends CustomPainter {
  Paint _paintBackground;
  Paint _paintFore;
  final double pi = 3.1415926;
  double jindu;

  CirclePainter(this.jindu) {
    _paintBackground = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..isAntiAlias = true;
    _paintFore = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..isAntiAlias = true;
  }
  @override
  void paint(Canvas canvas, Size size) {
    print("========$jindu");
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2,
        _paintBackground);
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );
    canvas.drawArc(rect, 0.0, jindu * 3.14 / 180, false, _paintFore);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}