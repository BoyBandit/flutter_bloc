import 'ChaptersData.dart';

/**
 * @Author:      Amuser
 * @CreateDate:   2019-10-16 9:47
 * @Description:
 */
class BeanFactory{
 static T  getObj<T>(data){
   switch(T.toString()){
     case'ChaptersData':

       return ChaptersData.fromJson(data) as T;
   }
 }
}