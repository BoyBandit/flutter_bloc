import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/http/ChaptersData.dart';
import 'package:flutter_bloc/http/HttpHelper.dart';
import 'package:flutter_bloc/http/Rsp.dart';
import 'package:flutter_bloc/news/bloc/BlocBase.dart';
import 'package:rxdart/rxdart.dart';

import 'HttpBloc.dart';


/**
 * @Author:      Amuser
 * @CreateDate:   2019-10-8 15:12
 * @Description:计数bloc
 */
class IncrementBloc extends HttpBloc{
  int _counter;

  /**
   * Stream来处理计数器
   */
  BehaviorSubject<int> _controller = BehaviorSubject<int>();

//  StreamController<int> _controller=new StreamController();
  StreamSink<int> get sink=>_controller.sink;//输入流
  Stream<int> get outCounter=>_controller.stream;//输出流



  IncrementBloc(){
    _counter=0;
//    getData<ChaptersData>(true,  "article/listproject/1/json", (t){
//      ChaptersData bean=t;
//      print("====json数据："+bean.toJson().toString());
//      _counter=bean.datas[0].chapterId;
//      sink.add(_counter);
//    });



    getListData<ChaptersData>( "article/listproject/1/json", (t){

      ChaptersData bean=t;
      print("====json数据："+bean.toJson().toString());
      _counter=bean.datas[0].chapterId;
      sink.add(_counter);
    });
//    getList(true, 1);
  }




  void  processCounter(){
      _counter++;
      sink.add(_counter);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.close();
  }

  int getSink(){
    return _counter;
  }



  getList(bool isLoad,int page, ) async {
    Response response = await HttpHelper().requestGet(
        isLoad,
        "article/listproject/" + page.toString() + "/json");
    if(response.statusCode==200){

      Rsp<ChaptersData> bean = Rsp.fromJson(response.data);
      print("=====可以进来？？？"+bean.errorCode.toString());
      switch (bean.errorCode) {
        case 0:
          print("=====进来"+bean.data.pageCount.toString());
          _counter=bean.data.pageCount;
          sink.add(_counter);
          break;
        default:
          break;
      }
    }else {
//      callBack(null);
    }

  }



  filtration<T>(T data,Response response,callBack(t)){

    if(response.statusCode==200){
      Rsp<T> bean = Rsp.fromJson(response.data);
      switch (bean.errorCode) {
        case 0:
          callBack(bean.data);
          break;
        default:
          
          break;
      }
    }else {
      callBack(null);
    }

  }


}