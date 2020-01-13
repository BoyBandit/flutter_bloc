// /   
// @Author:      Amuser
// @CreateDate:   2019-11-12 9:29
//@Description: 
import 'package:flutter/material.dart';

import 'custom/waveprogressbar.dart';

///
class Yhkloo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Yhkloo();
  }

}

class _Yhkloo extends State<Yhkloo>{
  WaterController waterController=WaterController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("块吐血了"),
          centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              height: 120,
              color: Colors.red,
            ),
            onTap: (){
              waterController.changeProgressRate(0.75);
            },
          ),GestureDetector(
            child: Container(
              height: 160,
              color: Colors.blue,
            ),
            onTap: (){
              waterController.changeProgressRate(0.0);
            }),
            new WaveProgressBar(
              flowSpeed: 2.0,
              waveDistance:45.0,
              waveHeight: 10,
              waterColor: Color(0xFFCBF0DF),
              //strokeCircleColor: Color(0x50e16009),
              progressController: waterController,
              percentage: 0.0,
              size: new Size (200,200),
              textStyle: new TextStyle(
//                            color:Color(0x00000000),
                  color:Color(0x00000000),
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }

}