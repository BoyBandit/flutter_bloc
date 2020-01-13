// /   
// @Author:      Amuser
// @CreateDate:   2019-11-5 14:59
//@Description: 
///
///
import 'dart:math';

import 'package:flutter/material.dart';

class ProgressManager extends StatefulWidget {
  double progress;

  ProgressManager(this.progress);

  @override
  _ProgressManagerState createState() =>
      new _ProgressManagerState().._factory = WavePainterFactory();
}

class _ProgressManagerState extends State<ProgressManager>
    with TickerProviderStateMixin {
  AnimationController xController;
  AnimationController yController;
  Animation<double> xAnimation;
  Animation<double> yAnimation;
//  List<double> _progressList = [];
  double curProgress = 0;
  BasePainterFactory _factory;

  set painter(BasePainterFactory factory) {
    _factory = factory;
  }

  setProgress(double progress) {
   setState(() {
//     _progressList.add(progress);
     onProgressChange();
   });
  }

  onProgressChange() {
    print("===这个是"+widget.progress.toString());
    if (widget.progress> 0) {
      if (yController != null && yController.isAnimating) {
        return;
      }
//      double nextProgress = _progressList[0];
//      _progressList.removeAt(0);
      final double begin = curProgress;
      yController = new AnimationController(
          vsync: this, duration: Duration(milliseconds: 1000));
      yAnimation =
          new Tween(begin: begin, end: widget.progress).animate(yController);
      yAnimation.addListener(_onProgressChange);
      yAnimation.addStatusListener(_onProgressStatusChange);
      yController.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    xController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    xAnimation = new Tween(begin: 0.0, end: 1.0).animate(xController);
    xAnimation.addListener(_change);
    yController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    yAnimation = new Tween(begin: 0.0, end: 1.0).animate(yController);
    yAnimation.addListener(_onProgressChange);
    yAnimation.addStatusListener(_onProgressStatusChange);

    doDelay(xController, 0);
    setProgress(widget.progress);
//    Future.delayed(Duration(milliseconds: 3000), () {
//      setProgress(0.66);
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Container(
        width: MediaQuery.of(context).size.width,
        height: 150.0,
        child: new CustomPaint(
          painter: _factory.getPainter()
            ..XAnimation = xAnimation
            ..YAnimation = yAnimation,
          size: new Size(150, 150),
        ),
      ),
    );
  }

  void _change() {
    setState(() {});
  }

  void _onProgressChange() {
    setState(() {
      curProgress = yAnimation.value;
    });
  }

  void _onProgressStatusChange(status) {
    if (status == AnimationStatus.completed) {
      onProgressChange();
    }
  }

  void doDelay(AnimationController controller, int delay) async {
    Future.delayed(Duration(milliseconds: delay), () {
      controller..repeat();
    });
  }

  @override
  void dispose() {
    xController.dispose();
    yController.dispose();
    xAnimation.removeListener(_change);
    yAnimation.removeListener(_onProgressChange);
    yAnimation.removeStatusListener(_onProgressStatusChange);
    super.dispose();
  }
}

abstract class BasePainterFactory {
  BasePainter getPainter();
}

class WavePainterFactory extends BasePainterFactory {
  BasePainter getPainter() {
    return WavePainter(
      waveCount: 1,
      waveColors: [
        Colors.lightBlueAccent[200],
      ],
      textStyle:
      TextStyle(
        fontSize: 60.0,
        foreground: Paint()
          ..color = Colors.lightBlue
          ..style = PaintingStyle.fill
          ..strokeWidth = 2.0
          ..blendMode = BlendMode.difference
          ..colorFilter = ColorFilter.mode(Colors.white, BlendMode.exclusion)
          ..maskFilter = MaskFilter.blur(BlurStyle.solid, 1.0),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}


class WavePainter extends BasePainter {
  int waveCount;
  int crestCount;
  double waveHeight;
  List<Color> waveColors;
  double circleWidth;
  Color circleColor;
  Color circleBackgroundColor;
  bool showProgressText;
  TextStyle textStyle;

  WavePainter(
      {this.waveCount = 1,
        this.crestCount = 2,
        this.waveHeight,
        this.waveColors,
        this.circleColor = Colors.grey,
        this.circleBackgroundColor = Colors.white,
        this.circleWidth = 5.0,
        this.showProgressText = true,
        this.textStyle = const TextStyle(
          fontSize: 60.0,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(color: Colors.grey, offset: Offset(5.0, 5.0), blurRadius: 5.0)
          ],
        )});

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    if (waveHeight == null) {
      waveHeight = height / 10;
      height = height + waveHeight;
    }

    if (waveColors == null) {
      waveColors = [
        Color.fromARGB(
            100, Colors.blue.red, Colors.blue.green, Colors.blue.blue)
      ];
    }

    Offset center = new Offset(width / 2, height / 2);
    double xMove = width * XAnimation.value;
    double yAnimValue = 0.0;
    if (YAnimation != null) {
      yAnimValue = YAnimation.value;
    }
    double yMove = height * (1.0 - yAnimValue);
    Offset waveCenter = new Offset(xMove, yMove);

    var paintCircle = new Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill
      ..strokeWidth = circleWidth
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 5.0);

//    canvas.drawCircle(center, min(width, height) / 2, paintCircle);

    List<Path> wavePaths = [];

    for (int index = 0; index < waveCount; index++) {
      double direction = pow(-1.0, index);
      Path path = new Path()
        ..moveTo(waveCenter.dx - width, waveCenter.dy)
        ..lineTo(waveCenter.dx - width, center.dy + height / 2)
        ..lineTo(waveCenter.dx + width, center.dy + height / 2)
        ..lineTo(waveCenter.dx + width, waveCenter.dy);

      for (int i = 0; i < 2; i++) {
        for (int j = 0; j < crestCount; j++) {
          double a = pow(-1.0, j);
          path
            ..quadraticBezierTo(
                waveCenter.dx +
                    width * (1 - i - (1 + 2 * j) / (2 * crestCount)),
                waveCenter.dy + waveHeight * a * direction,
                waveCenter.dx +
                    width * (1 - i - (2 + 2 * j) / (2 * crestCount)),
                waveCenter.dy);
        }
      }

      path..close();

      wavePaths.add(path);
    }
    var paint = new Paint()
      ..color = circleBackgroundColor
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 5.0);

    canvas.saveLayer(
        Rect.fromCircle(center: center, radius: min(width, height) / 2), paint);


//    canvas.drawCircle(center, min(width, height) / 2, paint);

    paint
//      ..blendMode = BlendMode.srcATop
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 10.0);

    for (int i = 0; i < wavePaths.length; i++) {
      if (waveColors.length >= wavePaths.length) {
        paint.color = waveColors[i];
      } else {
        paint.color = waveColors[0];
      }



      canvas.drawPath(wavePaths[i], paint);

//      canvas.drawArc(
//          Rect.fromCircle(center: center, radius: min(width, height) / 2),
//          -pi / 2, //圆开始的位置（正上方）
//          2 * pi*0.5,
////        360 * progress / 100 * 3.14 / 180,
//          false,
//          paint);

    }
//    paint.blendMode = BlendMode.srcATop;
    if (showProgressText) {
      TextPainter tp = TextPainter(
          text: TextSpan(
              text: '${(yAnimValue * 100.0).toStringAsFixed(0)}%',
              style: textStyle),
          textDirection: TextDirection.rtl)
        ..layout();

      tp.paint(
          canvas, Offset(center.dx - tp.width / 2, center.dy - tp.height / 2));
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}


abstract class BasePainter extends CustomPainter {
  Animation<double> _xAnimation;
  Animation<double> _yAnimation;

  set XAnimation(Animation<double> value) {
    _xAnimation = value;
  }

  set YAnimation(Animation<double> value) {
    _yAnimation = value;
  }

  Animation<double> get YAnimation => _yAnimation;

  Animation<double> get XAnimation => _xAnimation;
}

