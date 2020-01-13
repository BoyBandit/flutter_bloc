// /   
// @Author:      Amuser
// @CreateDate:   2019-11-11 10:47
//@Description: 
import 'package:flutter/material.dart';

import 'OpenDeviceAnimation.dart';

///
class LoadingTest extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoadingTest();
  }

}
class _LoadingTest extends State<LoadingTest>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("终级测试"),
        centerTitle: true,
      ),body: Column(
      children: <Widget>[
        OpenDeviceAnimation(),
        Container(
          height: 50,
          color: Colors.red,
        ),
        Container(
          height: 50,
          color: Colors.blue,
        )
      ],
    ),

//        floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.navigate_next),
//    onPressed: () {
//
//    }),
    );
  }

}