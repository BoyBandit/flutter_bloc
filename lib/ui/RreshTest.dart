import 'package:flutter/material.dart';
import 'package:flutter_bloc/refresh/RefreshWidget.dart';
import 'package:fluttertoast/fluttertoast.dart';

/**
 * @Author:      Amuser
 * @CreateDate:   2019-10-16 14:47
 * @Description:刷新自定义测试
 */
class RreshTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("统计数据"),
        centerTitle: true,
      ),
      body: RefreshWidget(refreshData: (){
        showToast("这是刷新");
      },loadingData: (){
        showToast("这是加载更多");
      },listWidget: _getListWidget(),

      ),

    );
  }

  void showToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white);
  }


  _getListWidget(){
    List<Widget> _list=new List();
    _list.add(_getCon("这是1",Colors.red));
    _list.add(_getCon("这是2",Colors.black));
    _list.add(_getCon("这是3",Colors.green));
    _list.add(_getCon("这是4",Colors.grey));
    _list.add(_getCon("这是5",Colors.yellow));
    _list.add(_getCon("这是6",Colors.brown));


    return _list;
  }
  Widget _getCon(String content,Color color){
    return Container(
      width: 300,
      color:color ,
      child: new Text(content),
      height: 200,
    );
  }
}