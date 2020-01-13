import 'dart:ui';

import 'package:cipher2/cipher2.dart';
import 'package:flutter/material.dart';

///
/// @Author:      Amuser
/// @CreateDate:   2019-12-30 15:19
///@Description: 
///
class ScrollviewStateList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScrollviewStateList();
  }

}

class _ScrollviewStateList extends State<ScrollviewStateList>{
   TextEditingController controller=new TextEditingController();
   ScrollController  _scrollController;
   int cc=0xFFFFFFFF;
   double _opacity=0.0;
   int stateColor=0;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int  barHeight=MediaQueryData.fromWindow(window).padding.top.toInt();
    print("到底多少$barHeight");
    _scrollController=new ScrollController()..addListener((){
       print("滑动了多少${_scrollController.position.pixels}");
       if(_scrollController.position.pixels<100){

         Colors.transparent;
            setState(() {
              _opacity=_scrollController.position.pixels/200;
              stateColor=(_scrollController.position.pixels/200*10).toInt()%5;
             print("查看前方输出=======$stateColor=============");

            });
       }else{
         setState(() {
           stateColor=4;
           _opacity=1.0;
         });
       }
    });
  }

  Color  getColor(int tt){
     switch(tt ){
       case 0:
         return Colors.white;
       case 1:
         return Colors.blue[100];
       case 2:
         return Colors.blue[200];
       case 3:
         return Colors.blue[300];
       case 4:
         return Colors.blue[500];
     }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:_getTextField(),
        centerTitle: true,
        leading: Text("佛山",style: TextStyle(color: Colors.white),),
       elevation: _opacity,
        backgroundColor:Colors.blue,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: <Widget>[
            Container(
              height: 222,
              color: Colors.red,
              child: GestureDetector(
                child: Text("获取解密符号",style:TextStyle(color: Colors.white),),
                onTap: (){
                  _getAes();
                },
              ),
            ),
            Container(
              height: 222,
              color: getColor(stateColor),
            ),
           Opacity(opacity: _opacity,child:  Container(
             height: 322,
             color: Colors.blue[50],
           ),),
            Container(
              height: 422,
              color:  Colors.red
            ),
            Container(
              height: 222,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }



  Widget _getTextField() {
    return new TextField(
      controller: controller,

      autocorrect: true,
      //是否自动更正
      autofocus: true,
      //是否自动对焦
      obscureText: true,
      //是否是密码
      textAlign: TextAlign.center,

//      buildCounter:buildCounter,
      decoration: InputDecoration(
        //输入框decoration属性
          contentPadding: new EdgeInsets.only(left: 0.0),
          border: InputBorder.none,

          hintText: "请输入搜索内容",

          hintStyle: new TextStyle(fontSize: 14, color: Colors.white)),
      //文本对齐方式
      style: TextStyle(
          fontSize: 22,
          color: Colors.blue), //输入文本的样式
//      onSubmitted:widget.submitText,

    );
  }

  _getAes() async{

    String nonce =await  Cipher2.generateNonce();
   String  result = await Cipher2.decryptAesGcm128("76da63e45511141bbd0ad86b443261b7", "e10adc3949ba59ab", nonce);
    print("================结果：$result");
  }
}