// /   
// @Author:      Amuser
// @CreateDate:   2019-11-8 14:54
//@Description: 测试数据
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'DialogWidget.dart';

class TestOpenApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestOpenApp();
  }

}
////https://www.jianshu.com/p/81c3503e4a0f
///https://www.jianshu.com/p/4646344881bb
class _TestOpenApp extends State<TestOpenApp>{

  //小米应用商店
    final String PACKAGE_MI_MARKET = "com.xiaomi.market";
    //魅族应用商店
    String PACKAGE_MEIZU_MARKET = "com.meizu.mstore";




   AndroidDeviceInfo _androidDeviceInfo;
   IosDeviceInfo _iosDeviceInfo;
   static bool isAndroid;
   static bool isIOS;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDeviceInfo();
  }

///OPPO、Xiaomi、vivo
  _getDeviceInfo()async{
    isAndroid = Platform.isAndroid;
    isIOS = Platform.isIOS;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (isAndroid) {
      print("==是否进来？？Android");
      _androidDeviceInfo = await deviceInfo.androidInfo;
      if (_androidDeviceInfo != null) {
        debugPrint('Running on ${_androidDeviceInfo.brand}');
      }
    }
    if (isIOS) {
      _iosDeviceInfo = await deviceInfo.iosInfo;
      if (_iosDeviceInfo != null) {
        debugPrint('Running on ${_iosDeviceInfo.name}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("无力吐槽"),
        centerTitle: true,
      ),
      body: Center(
        child: new GestureDetector(
          child: Text("打开淘宝app"),
          onTap: () {
            _launchURL();
//            showDialogs( context);
          },
        ),
      ),
    );
  }



  _launchURL() async {
    String url ="market://details?id=com.midea.power_saving";
//  String url="market://details?id=com.xiaomi.market&&appId=2882303761518254653";


//    String url="mimarket://details?id=com.midea.power_saving";//小米
//    String url="vivoMarket://details?id=com.midea.power_saving";//vivo
//    String url="appmarket://details?id=com.midea.power_saving";//华为
//    String url="oppomarket://details?id=com.midea.power_saving";//oppo不行
 //   String url="mstore://details?id=com.midea.power_saving";//魅族
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
//
//
    showDialogs(BuildContext context){

      showDialog<Null>(
          context: context, //BuildContext对象
          barrierDismissible: false,
          builder: (BuildContext context) {
            return new DialogWidget(text: "正在获取详情...");
          });

    }
//



//
//     showDialog(BuildContext context, String title, Widget content) {
//    List<Widget> list=new List();
//    Widget  widget=getItem("");
//    list.add( getItem("dd"));
//
//    CupertinoAlertDialog(
//      title: Text(title, style: TextStyle(fontSize: 17, color: MColors.textColorTitle, fontWeight: FontWeight.w600)),
//      content: Container(
//        child: content,
//        margin: EdgeInsets.only(top: 18),
//      ),
//      actions: <Widget>[
//        FlatButton(
//          color: Color(0xFFE5E5E8),
//          highlightColor: Color(0xFFDCDCDC),
//          padding: EdgeInsets.symmetric(vertical: 14),
//          child: Text('我知道了', style: TextStyle(fontSize: 16, color: MColors.colorPrimary)),
//          onPressed: () => Navigator.of(context).pop(),
//        ),
//      ],
//    );
//
//    Widget getItem(String url){
//      return GestureDetector(
//        child:Padding(padding: EdgeInsets.all(20),
//          child: Text(url),
//        ) ,
//        onTap: (){
////          launchURL(url);
//        },
//      );
//    }
//
//    launchURL(String url) async {
////    String url ="taobao://item.taobao.com/item.html?id=41700658839";
//      if (await canLaunch(url)) {
//        await launch(url);
//      } else {
//        throw 'Could not launch $url';
//      }
//    }
//
//
//
//  }




}
