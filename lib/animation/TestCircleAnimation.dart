// /
// @Author:      Amuser
// @CreateDate:   2019-11-5 11:33
//@Description:
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/animation/GradientCircularProgressIndicator.dart';

import 'CircleProgressBar.dart';
import 'ProgressManager.dart';
import 'custom/CircleAnimate.dart';
import 'custom/waveprogressbar.dart';

///
class TestCircleAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestCircleAnimation();
  }
}

class _TestCircleAnimation extends State<TestCircleAnimation> with TickerProviderStateMixin {
  AnimationController _animationController;
//  Animation<double> _wave;
//  Animation<double> _finishBubbles;
  WaterController waterController=WaterController();
  ScrollController _scrollController;
  final GlobalKey globalKey = GlobalKey();
  bool isLoading=false;
  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController(); //滚动监听控件
    _scrollController.addListener(() async{
//      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
////               _scrollController.position.
//      }

    if(globalKey.currentContext!=null){
        double maxH=_scrollController.position.pixels+MediaQuery.of(context).size.height-400;
//        print("======op"+maxH.toString()+"===$isLoading");
      if(maxH>globalKey.currentContext.size.height&& isLoading==false){
//        _getWH();
        isLoading=true;
//         _animationController.reset();
        if(_animationController.isCompleted){
//          print("=====是否${_animationController.isCompleted}");
          waterController.changeProgressRate(0.75);
          _animationController.reset();
          _animationController.forward();

        }


      }else if(maxH<globalKey.currentContext.size.height && isLoading==true){
        print("现在到了这里");
        waterController.changeProgressRate(0.0);
        isLoading=false;
      }
    }

    });
    WidgetsBinding widgetsBinding=WidgetsBinding.instance;
    widgetsBinding.addPostFrameCallback((callback){
      //这里写你想要显示的百分比
//      waterController.changeProgressRate(0.82);
    });
    _animationController = new AnimationController(vsync: this, duration: Duration(seconds: 1));
//    _wave = new Tween<double>(
//      begin: 0.0,
//      end: 1.0,
//    ).animate(
//      new CurvedAnimation(
//        parent: _animationController,
//        curve: Curves.linear,
//      ),
//    );
//
//    _finishBubbles = new Tween<double>(
//      begin: 0.0,
//      end: 1.0,
//    ).animate(
//      new CurvedAnimation(
//        parent: _animationController,
//        curve: Curves.linear,
//      ),
//    );
//    bool isForward = true;
//    _animationController.addStatusListener((status) {
//      if (status == AnimationStatus.forward) {
//        isForward = true;
//      } else if (status == AnimationStatus.completed ||
//          status == AnimationStatus.dismissed) {
//        if (isForward) {
//          _animationController.reverse();
//        } else {
//          _animationController.forward();
//        }
//      } else if (status == AnimationStatus.reverse) {
//        isForward = false;
//      }
//    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("圆形"),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
         controller: _scrollController,
        physics: ClampingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          children: <Widget>[
            Container(

              child: Column(
                key:globalKey ,
                children: <Widget>[
                  GestureDetector(
                    child: Container(
//          key: globalKey,
                      height:130.0 ,
                      color: Colors.red,
                    ),onTap: (){
                    waterController.changeProgressRate(0.75);
                  },
                  ),
//              _getBgWidget(130.0,Colors.red),
                GestureDetector(
                  child:   _getBgWidget(150.0,Colors.blue),
                  onTap: () {
                    processAnimate();
                  },
                ),
                  _getBgWidget(180.0,Colors.brown),
                  _getBgWidget(120.0,Colors.green),
                ],),
            ),
            _getBody(),
            _getBgWidget(130.0,Colors.yellow),
            _getBgWidget(160.0,Colors.purpleAccent),
          ],
        ),
      ),
//      body: _getBody(),
    );
  }

  processAnimate() {
    waterController.changeProgressRate(0.0);
//    _animationController.reset();
//    _animationController.forward();
  }

  void _getWH() {
    final containerWidth = globalKey.currentContext.size.width;
    final containerHeight = globalKey.currentContext.size.height;
    var size = globalKey.currentContext
        ?.findRenderObject()
        ?.paintBounds
        ?.size;
    print(size.toString());
//    print('=======Container widht is= $containerWidth, height is $containerHeight');
  }

  Widget _getBgWidget(double h,Color color){
    return Container(
      height:h ,
      color: color,
    );
  }
  Widget _getBody() {
    return Center(
        child: AnimatedBuilder(

            animation: _animationController,
            builder: (context, child) {
              double count = _animationController.value * 0.75;
//              waterController.changeProgressRate(0.75);
//              print("========进来了$count");
//              print("====" + count.toString() + "=====" + _animationController.value.toString());
              return Container(
                width: 400,
                height: 400,
                color: Colors.white,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: new WaveProgressBar(
                        flowSpeed: 2.0,
                        waveDistance:45.0,
                        waveHeight: 10,
                        waterColor: Color(0xFFCBF0DF),
                        //strokeCircleColor: Color(0x50e16009),
                        progressController: waterController,
                        percentage: 0.75,
                        size: new Size (200,200),
                        textStyle: new TextStyle(
//                            color:Color(0x00000000),
                            color:Color(0x00000000),
                            fontSize: 60.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                   Center(
                     child:  GradientCircularProgressIndicator(
                       colors: [Color(0xFF666666), Color(0xFF6CE68D)],
                       radius: 100.0,
                       stokeWidth: 10.0,
                       value: _animationController.value,
                       strokeCapRound: true,
                       progress: 0.75,
                     ),
                   ),

//                Center(
//
//                  child: ProgressManager(count),
//                ),
//                    Center(
//                      child: CustomPaint(
//                        size: Size(360.0, 360.0),
//                        painter: CircleAnimate(
//                          painterStatus: PainterStatus.wave,
//                          waveProgress: count,
//                          finishBubblesProgress: 1.0,
////          finishBubblesProgress:_finishBubbles.value,
//                        ),
//                      ),
//
//                    ),
                    Center(
                      child:  RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: '${(_animationController.value * 0.75 * 100).toInt()}',
                                style: TextStyle(fontSize: 50, color: Color(0xFF333333), fontWeight: FontWeight.w600)),
                            TextSpan(text: '%', style: TextStyle(fontSize: 12, color: Color(0xFF333333), fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
//                      child: Text("${(_animationController.value * 0.75 * 100).toInt()}%"),
                    )
                  ],
                ),
              );
            }));
  }

//  Widget _getBody(){
//     return Center(
//       child:Transform.rotate(
//         angle: pi / 2.0,
//         child: CustomPaint(
//         size: Size.fromRadius(100),
//         painter:CircleProgressBar(80,[Color(0xFF666666), Color(0xFF6CE68D)]) ,
//       )));
//  }

}
