import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'base_provider.dart';

enum PainterStatus {
  download,
  wave,
  tick,
}

class CircleAnimate extends CustomPainter {
  static const int LIQUID_COLOR_BLUE = 24;
  static const int LIQUID_ANIMATION_DURATION = 5000;
  static const int FAI_FACTOR = 12;
  static const double APTITUDE_RATIO = 0.2;
  static const double ANGLE_VELOCITY = 3.6;

  final PainterStatus painterStatus;
  BasePourProvider pourProvider;
  double liquidLevel = 0.0;
  final double waveProgress;
  final double finishBubblesProgress;
  double left = 0.0;
  Path wavePath = new Path();
  Path circlePath = new Path();
  double phi = 0.0;
  double currAmplitude = 0.0;
  Random random = new Random();

  CircleAnimate({
    this.painterStatus,
    this.waveProgress = 0.0,
    this.finishBubblesProgress = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    pourProvider = pourProvider ?? BasePourProvider.size(Size(360.0, 360.0));
    switch (painterStatus) {
      case PainterStatus.download:
//        _drawDownloadArrow(canvas, size);
        break;
      case PainterStatus.wave:
        _drawWave(canvas, size);
        break;
      case PainterStatus.tick:
//        _drawFinishTick(canvas, size);
        break;
    }
  }


  void _drawWave(Canvas canvas, Size size) {
    calcData(size);
    canvas.save();
    if (liquidLevel < pourProvider.bottom) {
      canvas.clipPath(circlePath);
      canvas.drawPath(wavePath, pourProvider.liquidPaint);
    }
    canvas.restore();
    pourProvider.draw(canvas, waveProgress);
  }

  void calcData(Size size) {
    Rect rect= Rect.fromLTWH(
      pourProvider.centerX - pourProvider.radius,
      pourProvider.centerY - pourProvider.radius,
      pourProvider.radius * 2,
      pourProvider.radius * 2,
    );
    circlePath.addOval(
      rect,
    );
    double amplitude = pourProvider.radius * APTITUDE_RATIO;
    left = pourProvider.centerX - pourProvider.radius;
    pourProvider.pourBottom.y = size.width + pourProvider.frameTop;
    liquidLevel =
        pourProvider.bottom - (2 * pourProvider.radius * waveProgress);
    // computeWave
    double reduceRatio =
        1.4 + (liquidLevel - pourProvider.top) / (2 * pourProvider.radius);
    currAmplitude = amplitude * reduceRatio;
    calcPhi();
    calcPath();
    calcColor(rect);
  }

  void calcPath() {
    wavePath.reset();
    for (int i = 0; i < 2 * pourProvider.radius; i++) {
      double dx = left + i;
      // y = a * sin( w * x + fai ) + h
      double dy = currAmplitude * sin((i * ANGLE_VELOCITY + phi) * pi / 180.0) +
          liquidLevel;
      if (i == 0) {
        wavePath.moveTo(dx, dy);
      } else {
        wavePath.lineTo(dx + 1, dy);
      }
    }

    wavePath.lineTo(
        pourProvider.centerX + pourProvider.radius, pourProvider.bottom);
    wavePath.lineTo(left, pourProvider.bottom);
    wavePath.close();
  }

  void calcColor(Rect rect) {
    int red = (liquidLevel >= pourProvider.centerY)
        ? 255
        : ((1 - (pourProvider.centerY - liquidLevel) / pourProvider.radius) *
        255)
        .round();
    int green = (liquidLevel <= pourProvider.centerY)
        ? 255
        : ((1 - (liquidLevel - pourProvider.centerY) / pourProvider.radius) *
        255)
        .round();
    Color liquidColor = Color.fromARGB(255, red, green, LIQUID_COLOR_BLUE);
//    pourProvider.liquidPaint..color = liquidColor;
//    pourProvider.bubblePaint..color = liquidColor;
    pourProvider.liquidPaint..color = Color(0xFF6CE68D);
//    pourProvider.liquidPaint..shader=SweepGradient(
//        startAngle:  0.0,
//        colors:  [Color(0x990BC497),  Color(0xFF6CE68D)]
//
//    ).createShader(rect);
    pourProvider.bubblePaint..color = Color(0xFF6CE68D);
  }

  //这是气泡
  void calcPhi() {
    if (liquidLevel < pourProvider.bottom) {
      double faiFactor;
      if (liquidLevel > pourProvider.centerY) {
        faiFactor =
            0.4 + (liquidLevel - pourProvider.centerY) / pourProvider.radius;
      } else {
        faiFactor =
            0.4 + (pourProvider.centerY - liquidLevel) / pourProvider.radius;
      }
      phi += FAI_FACTOR * (faiFactor);
      if (phi >= 360) {
        int count = random.nextInt(4);
        pourProvider.clearBubbles();
        for (int i = 0; i < count; i++) {
          pourProvider.generateBubble(pourProvider.centerX, liquidLevel);
        }
        phi = 0.0;
      }
    }
  }

  @override
  bool shouldRepaint(CircleAnimate oldDelegate) {
    phi = oldDelegate.phi;
    pourProvider = oldDelegate.pourProvider;
    if (waveProgress == 1.0 && painterStatus != PainterStatus.tick) {
      pourProvider.clearBubbles();
    }
    return true;
  }
}
