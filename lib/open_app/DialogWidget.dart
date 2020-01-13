import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
/**
 * Created by Amuser
 * Date:2019/7/4.
 * Desc:弹窗案列
 * https://www.jianshu.com/p/4bbbb5aa855d
 * https://www.jianshu.com/p/52e0cce2be0a
 */

 class DialogWidget extends Dialog{
   String text;

   DialogWidget({Key key, @required this.text}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return new Material( //创建透明层
       type: MaterialType.transparency, //透明类型
       child: new Center( //保证控件居中效果
         child: new SizedBox(
//           width: 120.0,
//           height: 120.0,
           child:Column(
             children: <Widget>[
//               getItem("mqq://"),
//               getItem("weixin://"),
//               getItem("openapp.jdmoble://"),
//               getItem("taobao://"),
//               getItem("imeituan://"),
             ],
           ) ,
         ),
       ),
     );
   }


   Widget getItem(String url,String content){
      return GestureDetector(
        child:Padding(padding: EdgeInsets.all(20),
          child: Text(content),
        ) ,
        onTap: (){
          _launchURL(url);
        },
      );
    }
   _launchURL(String url) async {
//    String url ="taobao://item.taobao.com/item.html?id=41700658839";
     if (await canLaunch(url)) {
       await launch(url);
     } else {
       throw 'Could not launch $url';
     }
   }
 }