/**
 * @Author:      Amuser
 * @CreateDate:   2019-10-26 10:38
 * @Description:dio封装
 */

import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter_bloc/http/Rsp.dart';

import 'GlobalConfig.dart';
import 'ResultCode.dart';

/*
 * 网络请求管理类
 */
class DioManager {

  //写一个单例
  //在 Dart 里，带下划线开头的变量是私有变量
  static DioManager _instance;

  static DioManager getInstance() {
    if (_instance == null) {
      _instance = DioManager();
    }
    return _instance;
  }
  Dio dio = new Dio();
  DioManager() {
    // Set default configs
    dio.options.headers = {
      "version":'2.0.9',
      "Authorization":'_token',
    };
    dio.options.baseUrl  = "https://www.wanandroid.com/";
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;

    dio.interceptors.add(LogInterceptor(responseBody: GlobalConfig.isDebug)); //是否开启请求日志
    dio.interceptors.add(CookieManager(CookieJar()));//缓存相关类，具体设置见https://github.com/flutterchina/cookie_jar
  }

  //get请求
  get<T>(String url, FormData params,Function successCallBack,Function errorCallBack) async {
    _requstHttp<T>(url, successCallBack, 'get', params, errorCallBack);
  }

  //post请求
  post<T>(String url, params,Function successCallBack,Function errorCallBack) async {
    _requstHttp<T>(url, successCallBack, "post", params, errorCallBack);
  }

  _requstHttp<T>(String url, Function successCallBack,
      [String method, FormData params, Function errorCallBack]) async {
    Response response;
    try {
      if (params != null && params.isNotEmpty) {
        switch (method) {
          case 'get':
              response = await dio.get(url, queryParameters: params);
            break;
          case 'post':
              response = await dio.post(url, data: params);
            break;
        }
      }else{
        switch (method) {
          case 'get':
            response = await dio.get(url);
            break;
          case 'post':
            response = await dio.post(url, data: params);
            break;
        }
      }

    }on DioError catch(error) {
      print("======报错了哦");
      // 请求错误处理
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      // 请求超时
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = ResultCode.CONNECT_TIMEOUT;
      }
      // 一般服务器错误
      else if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = ResultCode.RECEIVE_TIMEOUT;
      }

      // debug模式才打印
      if (GlobalConfig.isDebug) {
        print('请求异常: ' + error.toString());
        print('请求异常url: ' + url);
        print('请求头: ' + dio.options.headers.toString());
        print('method: ' + dio.options.method);
      }
      _error(errorCallBack, error.message);
      return '';
    }
    // debug模式打印相关数据
    if (GlobalConfig.isDebug) {
      print('请求url: ' + url);
      print('请求头: ' + dio.options.headers.toString());
      if (params != null) {
        print('请求参数: ' + params.toString());
      }
      if (response != null) {
        print('返回参数: ' + response.toString());
      }
    }
    String dataStr = json.encode(response.data);
    Map<String, dynamic> dataMap = json.decode(dataStr);
    if (dataMap == null || dataMap['state'] == 0) {
      _error(errorCallBack, '错误码：' + dataMap['errorCode'].toString() + '，' + response.data.toString());
    }else if (successCallBack != null) {
      Rsp<T> rsp=Rsp.fromJson(dataMap);
      successCallBack(rsp.data);
    }
  }
  _error(Function errorCallBack, String error) {
    if (errorCallBack != null) {
      errorCallBack(error);
    }
  }
}