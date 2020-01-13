// /   
// @Author:      Amuser
// @CreateDate:   2019-11-5 13:59
//@Description: 
import 'package:flutter/material.dart';

///
//进度条
class CircleProgressBar extends CustomPainter {
  Paint _paintBackground;
  Paint _paintFore;
  final double pi = 3.1415926;
  var progress; //0-360
  final List<Color> colors;

  CircleProgressBar(this.progress,this.colors) {
    _paintBackground = Paint()
      ..color = Color(0xFFEFEFEF)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..isAntiAlias = true;

  }

  updateProgress(int pg) {
    this.progress = pg;
    print(progress);
  }

  @override
  void paint(Canvas canvas, Size size) {


    //绘制流程
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2,
        _paintBackground);
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );
    _paintFore = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..isAntiAlias = true
      ..shader=SweepGradient(
        startAngle: 0.0,
        colors: colors,
      ).createShader(rect);
    canvas.drawArc(
        rect,
        -pi / 2, //圆开始的位置（正上方）
        2 * pi*0.5,
//        360 * progress / 100 * 3.14 / 180,
        false,
        _paintFore);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    //刷新布局的时候告诉Flutter是否需要重绘
    return true;
  }
}
