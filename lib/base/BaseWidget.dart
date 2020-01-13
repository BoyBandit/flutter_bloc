import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'BaseFulWidget.dart';
import 'BaseStateWidget.dart';
/**
 * Created :Auser
 *  Date: 2019/5/6.
 *  Desc:初始化Scaffold
 */

class BaseWidget<T extends BaseFulWidget> extends BaseStateWidget<T> {

  String _titles;
  Color _themeColor=null; //当前主题颜色
  BaseWidget(this._titles);

  @override
  Widget getBuildWidget(BuildContext buildContext) {
    // TODO: implement getBuildWidget
    return Scaffold(
            appBar: new AppBar(
              title: new Text(_titles),
              centerTitle: true,
            ),
            body:  setWidget(context),
        floatingActionButton: FloatingActionButton(
        child: const  Icon(Icons.add),
    onPressed: (){

//          bloc.incrementCounter.add(null);
    },
    ),
          );

//    return
//      Theme(
////          data: ThemeData(
////              primarySwatch:_themeColor==null?Colors.red:_themeColor,
////              iconTheme: IconThemeData(color:_themeColor==null?Colors.red:_themeColor)
////          ),
//          child: Scaffold(
//            appBar: new AppBar(
//              title: new Text(_titles),
//              centerTitle: true,
//            ),
//            body:  setWidget(context),
//          ));
  }


  void setBgThemeColor(Color color){
    setState(() {
      this._themeColor=color;
    });
  }


//  Widget _getBodyWidget(){
//    return new Column(children: <Widget>[
//      new BaseAppBar(
//          setLeftIcon(), Icons.keyboard_arrow_left, _titles,
//          setTitleRight(), () {
//        onLeftBack();
//      }, () {
//        onRightBack();
//      }),
//      new Expanded( child: setWidget(context), )
//
//    ],);
//  }



  String setTitleRight() {
    return "";
  }

  bool setLeftIcon() {
    return true;
  }

  void onLeftBack() {
    closeWidget();
  }


//  Color  setThemeColor(Color color){
//    return  color;
//  }

  void onRightBack() {
    widget.showToast("按了其它事件");
  }

  Widget setWidget(BuildContext buildContext) {
    return new Text("请重新编写widget");
  }

  void showToast(String msg) {
    widget.showToast(msg);
  }

}