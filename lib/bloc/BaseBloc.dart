import 'package:flutter/material.dart';

/**
 * @Author:      Amuser
 * @CreateDate:   2019-10-8 14:58
 * @Description:
 */
abstract  class BlocBase {
  void dispose();//销毁
}

class BlocProvider<T extends BlocBase> extends StatefulWidget{
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }): super(key: key);

  final T bloc;
  final Widget child;



  @override
  _BlocProviderState<T> createState() {
    // TODO: implement createState
    return _BlocProviderState<T>();
  }


  static T of<T extends BlocBase>(BuildContext context){
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;

}

class _BlocProviderState<T> extends  State<BlocProvider<BlocBase>>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.child;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.bloc.dispose();
    super.dispose();
  }

}


