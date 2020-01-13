import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/IncrementBloc.dart';
import 'package:flutter_bloc/news/bloc/BlocBase.dart';

/**
 * @Author:      Amuser
 * @CreateDate:   2019-10-8 16:20
 * @Description: 更新上一个widget
 */
class UpdateCount extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final  bloc = BlocProvider.of<IncrementBloc>(context);
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("更新数据"),
      ),
      body: new Center(
        child: StreamBuilder(
          stream: bloc.outCounter,
            initialData: bloc.getSink(),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
               return new GestureDetector(
                 child: new Text("这是${snapshot.data}"),
                 onTap: (){
                   Navigator.pop(context);
                 },
               );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const  Icon(Icons.add),
        onPressed: (){
          bloc.processCounter();
//          bloc.incrementCounter.add(null);
        },
      ),
    );
  }




}