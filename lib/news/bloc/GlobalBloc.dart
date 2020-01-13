import 'package:rxdart/rxdart.dart';

/**
 * @Author:      Amuser
 * @CreateDate:   2019-10-9 9:30
 * @Description:bloc单列模式
 */
class GlobalBloc {
  ///
  /// 与此BLoC相关的流
  ///
  BehaviorSubject<String> _controller = BehaviorSubject<String>();

  Function(String) get push => _controller.sink.add;

  Stream<String> get stream => _controller;

  ///
  /// Singleton工厂
  ///
  static final GlobalBloc _bloc = new GlobalBloc._internal();

  factory GlobalBloc(){
    return _bloc;
  }

  GlobalBloc._internal();

  ///
  /// Resource disposal
  ///
  void dispose() {
    _controller?.close();
  }
}
  GlobalBloc globalBloc = GlobalBloc();