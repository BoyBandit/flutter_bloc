// /
// @Author:      Amuser
// @CreateDate:   2019-11-15 17:30
//@Description: 相册
import 'package:flutter/material.dart';
///image_picker: ^0.4.12
///
///
class ImagePickerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImagePickerState();
  }
}

class _ImagePickerState extends State<ImagePickerWidget> {
  var _imgPath;

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text("ImagePicker"),
//        ),
//        body: SingleChildScrollView(
//          child: Column(
//            children: <Widget>[
//              _ImageView(_imgPath),
//              RaisedButton(
//                onPressed: _takePhoto,
//                child: Text("拍照"),
//              ),
//              RaisedButton(
//                onPressed: _openGallery,
//                child: Text("选择照片"),
//              ),
//            ],
//          ),
//        ));
//  }

//  /*图片控件*/
//  Widget _ImageView(imgPath) {
//    if (imgPath == null) {
//      return Center(
//        child: Text("请选择图片或拍照"),
//      );
//    } else {
//      return Image.file(
//        imgPath,
//      );
//    }
//  }
//
//
//  /*拍照*/
//  _takePhoto() async {
//    var image = await ImagePicker.pickImage(source: ImageSource.camera);
//
//    setState(() {
//      print("到这里来了===");
//      _imgPath = image;
//    });
//  }
//
//  /*相册*/
//  _openGallery() async {
//    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//    setState(() {
//      print("到这里来了相册");
//      _imgPath = image;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
