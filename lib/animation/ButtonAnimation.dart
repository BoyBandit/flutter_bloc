// /   
// @Author:      Amuser
// @CreateDate:   2019-11-1 16:36
//@Description: 按钮动画
import 'package:flutter/material.dart';


class ButtonAnimation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonAnimation();
  }

}

class _ButtonAnimation extends State<ButtonAnimation> with SingleTickerProviderStateMixin {
AnimationController _controller;
Animation<Offset> animation;
Animation<EdgeInsets> movement;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(duration: const Duration(seconds: 2),vsync: this);
    animation =
        Tween(begin: Offset(1, 0), end: Offset(0, 0)).animate(_controller);
     movement = EdgeInsetsTween(
      begin: EdgeInsets.only(top: 0.0),
      end: EdgeInsets.only(top: 100.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.2,
          0.375,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }


@override
void didChangeDependencies() {
  super.didChangeDependencies();
  print("我进来一次didChangeDependencies======HomePage");
  //渲染完成第一帧后会走这个回调,弹窗也要在渲染完成后才能调用
  WidgetsBinding.instance
      .addPostFrameCallback((_) => _processData());
}

_processData() async {

    _controller.forward();

}
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("动画测试"),
        centerTitle: true,
      ),
      body:  Container(
          width: 300,
          height: 50,
          padding: EdgeInsets.all(15),
          alignment: Alignment.centerRight,
          child: AnimatedBuilder(animation: animation, builder: (context,Widget){
            return SlideTransition(position: animation,
            child: _getText(),
            );
          }),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30.0))
          ),
        ),

    );
  }
  
  Widget _getText(){
    return Text("正在开启所有设备的省电功能哦",style: TextStyle(color: Colors.red),);
  }

}