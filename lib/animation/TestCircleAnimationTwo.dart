// /   
// @Author:      Amuser
// @CreateDate:   2019-11-13 14:47
//@Description:
///
// /
// @Author:      Amuser
// @CreateDate:   2019-11-5 11:33
//@Description:
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/animation/GradientCircularProgressIndicator.dart';

import 'custom/waveprogressbar.dart';

///
class TestCircleAnimationTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestCircleAnimationTwo();
  }
}

class _TestCircleAnimationTwo extends State<TestCircleAnimationTwo> with TickerProviderStateMixin {
  AnimationController _animationController;
  WaterController waterController=WaterController();
  ScrollController _scrollController;
  final GlobalKey globalKey = GlobalKey();
  bool isLoading=false;
  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController(); //滚动监听控件
    _scrollController.addListener(() async{
      if(globalKey.currentContext!=null){
        double maxH=_scrollController.position.pixels+MediaQuery.of(context).size.height-400;
        if(maxH>globalKey.currentContext.size.height&& isLoading==false){
          isLoading=true;
          if(_animationController.isCompleted){
            waterController.changeProgressRate(0.75);
            _animationController.reset();
            _animationController.forward();
          }
        }else if(maxH<globalKey.currentContext.size.height && isLoading==true){
          waterController.changeProgressRate(0.0);
          isLoading=false;
        }
      }
    });
    _animationController = new AnimationController(vsync: this, duration: Duration(seconds: 1));
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


  Widget _getBgWidget(double h,Color color){
    return Container(
      height:h ,
      color: color,
    );
  }
  Widget _getBody() {
    return AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
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
                        colors:[Color(0xFF0BC497), Color(0xFF6CE68D)],
                        radius: 100.0,
                        stokeWidth: 10.0,
                        value: _animationController.value,
                        strokeCapRound: true,
                        progress: 0.75,
                      ),
                    ),
                    Center(
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: '${(_animationController.value * 0.75 * 100).toInt()}',
                                    style: TextStyle(fontSize: 50, color: Color(0xFF333333), fontWeight: FontWeight.w600)),
                                TextSpan(text: '%', style: TextStyle(fontSize: 12, color: Color(0xFF333333), fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          Text('我超越的用户数', style: TextStyle(fontSize: 12, color:  Color(0xFF333333))),
                        ],
                      )
                    )
                  ],
                ),
              );
            });
  }


}
