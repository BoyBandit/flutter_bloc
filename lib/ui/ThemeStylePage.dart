import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/base/BaseFulWidget.dart';
import 'package:flutter_bloc/base/BaseWidget.dart';

/**
 * @Author:      Amuser
 * @CreateDate:   2019-10-23 9:37
 * @Description:设置主题颜色
 */

class ThemeStylePage extends BaseFulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ThemeStylePage("状态栏设置");
  }

}

class _ThemeStylePage extends BaseWidget<ThemeStylePage>{
  _ThemeStylePage(String titles) : super(titles);
  Color _color;
  @override
  Widget setWidget(BuildContext buildContext) {
    // TODO: implement setWidget
    return Center(
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Text("加载主题色"),
            onTap: (){

              setBgThemeColor(Colors.blue);

            },
          ),
          GestureDetector(
            child: Text("跳转"),
            onTap: (){

            },
          ),
        ],
      ),
    );
  }



}