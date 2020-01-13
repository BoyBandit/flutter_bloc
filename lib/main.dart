import 'package:flutter/material.dart';
import 'package:flutter_bloc/news/bloc/BlocBase.dart';
import 'package:flutter_bloc/ui/CounterPage.dart';
import 'package:flutter_bloc/ui/CustomViewPage.dart';
import 'package:flutter_bloc/ui/ImageLis.dart';
import 'package:flutter_bloc/ui/PermissionManager.dart';
import 'package:flutter_bloc/ui/RreshTest.dart';
import 'package:flutter_bloc/ui/ScrollviewStateList.dart';
import 'package:flutter_bloc/ui/TestCustomPoint.dart';
import 'package:flutter_bloc/ui/TestPicker.dart';
import 'package:flutter_bloc/ui/ThemeStylePage.dart';

import 'animation/ButtonAnimation.dart';
import 'animation/HomeContent.dart';
import 'animation/HomeContentTwo.dart';
import 'animation/LoadingTest.dart';
import 'animation/LottieTest.dart';
import 'animation/MoveAnimation.dart';
import 'animation/OpenDeviceAnimation.dart';
import 'animation/TestCircleAnimation.dart';
import 'animation/TestCircleAnimationTwo.dart';
import 'animation/Yhkloo.dart';
import 'bloc/IncrementBloc.dart';
import 'open_app/TestOpenApp.dart';


void main() => runApp(MyApp());

/**
 * scoped 入口
 */
class MyApp extends StatelessWidget {
//
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'scoped',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        iconTheme:IconThemeData(color: Colors.red),
        indicatorColor: Colors.white,
        accentColor: Colors.red,

      ),
      home:ScrollviewStateList(),
    );
  }
}


//  @override
//  Widget build(BuildContext context) {
//    return BlocProvider(
//      child: MaterialApp(
//        title: 'scoped',
//        theme: ThemeData.dark(),
//        home: MyHomePage(),
//      ),bloc: IncrementBloc(),
//    );
//  }
//}



//void main() => runApp(BlocProvider(child: MyApp(),bloc: IncrementBloc(),));
//
///**
// * scoped 入口
// */
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return  MaterialApp(
//        title: 'scoped',
//        theme: ThemeData.dark(),
//        home: CounterPage(),
//
//    );
//  }
//}

