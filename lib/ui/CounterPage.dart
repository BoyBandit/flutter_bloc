import 'package:flutter/material.dart';
import 'package:flutter_bloc/animation/LoadingTest.dart';
import 'package:flutter_bloc/bloc/IncrementBloc.dart';
import 'package:flutter_bloc/news/bloc/BlocBase.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'UpdateCountPage.dart';
/**
 * @Author:      Amuser
 * @CreateDate:   2019-10-8 15:28
 * @Description:统计数据
 */
class CounterPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final IncrementBloc bloc = BlocProvider.of<IncrementBloc>(context);
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("统计数据"),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: bloc.outCounter,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
            return GestureDetector(
              child: Text("显示${snapshot.data} times"),
              onTap: (){

//                Fluttertoast.cancel();
                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return new LoadingTest();
                }));

              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const  Icon(Icons.add),
        onPressed: (){
          _getData ();
          bloc.processCounter();
//          bloc.incrementCounter.add(null);
        },
      ),
    );
  }

   _getData (){






     Fluttertoast.cancel();
     Fluttertoast.showToast(msg: '网络异常，请检查您的网络设置', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER);
     Fluttertoast.cancel();
     Fluttertoast.showToast(msg: '为什么会这样', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER);
     Fluttertoast.cancel();
     Fluttertoast.showToast(msg: '不晓得是这样啊', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER);
     Fluttertoast.cancel();
     Fluttertoast.showToast(msg: 'toast测试么，应该是', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER);
  }


  _back(BuildContext context){
    Navigator.of(context).push(

        new MaterialPageRoute(builder: (BuildContext context) {

//TextWdigetPage要跳转的页面

//title要传递的参数
//            return  BlocProvider(child: UpdateCount(), bloc: IncrementBloc());
          return UpdateCount();

        }));

    }
}