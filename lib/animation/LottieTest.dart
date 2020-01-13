// /   
// @Author:      Amuser
// @CreateDate:   2019-11-4 14:03
//@Description: 
import 'package:flutter/material.dart';
import 'package:flutter_lottie/flutter_lottie.dart';
///
class LottieTest extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LottieTest();
  }

}

class _LottieTest extends  State<LottieTest>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.red,
      child: Center(
        child: Container(
          width: 50,
          height:50,
          color: Color(0xFF1EE6A5),
          child: LottieView.fromFile(
            filePath: 'assets/load_ok.json',
            autoPlay: true,
            loop: false,
            reverse: true,
          ),
        ),
      ),
    );
  }

}