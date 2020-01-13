


import 'BeanFactory.dart';

/**
 * @Author:      Amuser
 * @CreateDate:   2019-10-16 8:55
 * @Description:
 */

class Rsp<T>{
  T data;

  int errorCode;

  String errorMsg;

  Rsp(this.data,this.errorCode,this.errorMsg,);
   Rsp.fromJson(Map<String, dynamic> srcJson){
     errorCode = srcJson['errorCode'];
     errorMsg=srcJson['errorMsg'];
     data=srcJson["data"]==null?null:BeanFactory.getObj(srcJson["data"]);
   }


}





