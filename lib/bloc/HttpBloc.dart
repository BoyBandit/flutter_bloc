import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/dio/DioManager.dart';
import 'package:flutter_bloc/http/ChaptersData.dart';
import 'package:flutter_bloc/http/HttpHelper.dart';
import 'package:flutter_bloc/http/Rsp.dart';
import 'package:flutter_bloc/news/bloc/BlocBase.dart';

/**
 * @Author:      Amuser
 * @CreateDate:   2019-10-16 11:11
 * @Description:网络Bloc
 */
class HttpBloc extends BlocBase{


 getData<T>(bool isLoad,String url,callBack(t)) async {
    Response response = await HttpHelper().requestGet(isLoad, url);
    if(response.statusCode==200){

      Rsp<T> bean = Rsp.fromJson(response.data);
      print("到碗里来"+bean.errorCode.toString());
      switch (bean.errorCode) {
        case 0:
//          print("数据是："+bean.data.toString());
          callBack(bean.data);
          break;
        default:
          break;
      }
    }else {
      callBack(null);
    }

  }

  getListData<T>(String url,callBack(t)) async{
   await DioManager().get<T>(url, null, (data){
           callBack(data);
   }, (error){
           callBack(null);
   });
  }


  @override
  void dispose() {

//    WidgetsBinding.instance
//        .addPostFrameCallback((_) => _getData(_mPage));
    // TODO: implement dispose
  }

}
