import 'package:flutter/material.dart';


typedef    void   RefreshData();
typedef    void   LoadingData();
/**
 * @Author:      Amuser
 * @CreateDate:   2019-10-16 14:18
 * @Description:刷新
 */
class RefreshWidget extends StatefulWidget{
 final RefreshData refreshData;
final   LoadingData   loadingData;
final List<Widget>  listWidget;

  RefreshWidget({this.refreshData, this.loadingData,@required this.listWidget});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateRefreshWidget();
  }

}

class StateRefreshWidget extends State<RefreshWidget>{
  ScrollController _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController=new ScrollController();
    _scrollController.addListener((){
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        widget.loadingData();
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _onRresh();
  }

  Widget _onRresh(){
    return  RefreshIndicator(
        child: ListView(
          controller: _scrollController,
          children: widget.listWidget,
        ),
        onRefresh: _refreshData);
  }

  Future<Null> _refreshData() async {
    widget.refreshData();
  }

  Widget _getCon(String content,Color color){
    return Container(
      width: 300,
      color:color ,
      child: new Text(content),
      height: 200,
    );
  }
}

