/**
 * @Author:      Amuser
 * @CreateDate:   2019-10-15 14:38
 * @Description:
 */
import 'package:flutter/material.dart';

import 'CountBLoC.dart';

class BlocProvider extends InheritedWidget {
  CountBLoC bLoC = CountBLoC();

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static CountBLoC of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bLoC;
}