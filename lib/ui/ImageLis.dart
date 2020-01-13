import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

///
/// @Author:      Amuser
/// @CreateDate:   2019-12-9 10:39
///@Description: 图片颜色
///
class ImageLis extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ImageLis();
  }

}

class _ImageLis extends  State<ImageLis>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("图片监听"),
        centerTitle: true,
      ),
      body: CachedNetworkImage(
        imageUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1575871569328&di=185983022bd920c501dadd573ae7c3c7&imgtype=0&src=http%3A%2F%2Fgss0.baidu.com%2F-4o3dSag_xI4khGko9WTAnF6hhy%2Fzhidao%2Fpic%2Fitem%2Fb151f8198618367a2ea753a32e738bd4b31ce5a6.jpg",
        imageBuilder: (context, imageProvider) {
          if(imageProvider==null){
            print("现在就是空哦哦=======");
          }
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter:
                  ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
            ),
          );
        },
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }




}