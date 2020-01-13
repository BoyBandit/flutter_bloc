// /   
// @Author:      Amuser
// @CreateDate:   2019-11-19 18:06
//@Description: 上传图片
import 'package:flutter/material.dart';
typedef void DeleteImage();
class UploadImage extends StatefulWidget{
  final String  _url;
  final  DeleteImage _deleteImage;
  UploadImage(this._url,this._deleteImage,{Key key}) :super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UploadImage();
  }

}
class _UploadImage extends State<UploadImage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Image.network(
          widget._url,
          fit: BoxFit.fill,
          width: 100,
          height:100,
        ),
        IconButton(icon:  const  Icon(Icons.close), onPressed: (){
                 widget._deleteImage;
        })
      ],
    );
  }

}