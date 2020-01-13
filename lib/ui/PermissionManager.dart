//import 'dart:async';
//
//import 'package:flutter/material.dart';
//import 'package:notification_permissions/notification_permissions.dart';
//
//class PermissionManager extends StatefulWidget {
//  @override
//  _PermissionManager createState() => _PermissionManager();
//}
//
//class _PermissionManager extends State<PermissionManager> with WidgetsBindingObserver {
//  Future<String> permissionStatusFuture;
//
//  var permGranted = "granted";
//  var permDenied = "denied";
//  var permUnknown = "unknown";
//
//  @override
//  void initState() {
//    super.initState();
//    // set up the notification permissions class
//    // set up the future to fetch the notification data
//    permissionStatusFuture = getCheckNotificationPermStatus();
//    // With this, we will be able to check if the permission is granted or not
//    // when returning to the application
//    WidgetsBinding.instance.addObserver(this);
//  }
//
//  /// When the application has a resumed status, check for the permission
//  /// status
//  @override
//  void didChangeAppLifecycleState(AppLifecycleState state) {
//    if (state == AppLifecycleState.resumed) {
//      setState(() {
//        permissionStatusFuture = getCheckNotificationPermStatus();
//      });
//    }
//  }
//
//  /// Checks the notification permission status
//  Future<String> getCheckNotificationPermStatus() {
//    return NotificationPermissions.getNotificationPermissionStatus().then((status) {
//      switch (status) {
//        case PermissionStatus.denied:
//          return permDenied;
//        case PermissionStatus.granted:
//          return permGranted;
//        case PermissionStatus.unknown:
//          return permUnknown;
//      }
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: const Text('Notification Permissions'),
//        ),
//        body: Center(
//            child: Container(
//          margin: EdgeInsets.all(20),
//          child: FutureBuilder(
//              future: permissionStatusFuture,
//              builder: (context, snapshot) {
//                // if we are waiting for data, show a progress indicator
//                if (snapshot.connectionState == ConnectionState.waiting) {
//                  return CircularProgressIndicator();
//                }
//                if (snapshot.hasData) {
//                  var textWidget = Text(
//                    "The permission status is ${snapshot.data}",
//                    style: TextStyle(fontSize: 20),
//                    softWrap: true,
//                    textAlign: TextAlign.center,
//                  );
//                  // The permission is granted, then just show the text
//                  if (snapshot.data == permGranted) {
//                    return textWidget;
//                  }
//
//                  // else, we'll show a button to ask for the permissions
//                  return Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      textWidget,
//                      SizedBox(
//                        height: 20,
//                      ),
//                      FlatButton(
//                        color: Colors.amber,
//                        child: Text("Ask for notification status".toUpperCase()),
//                        onPressed: () {
//                          // show the dialog/open settings screen
////                              NotificationPermissions
////                                  .requestNotificationPermissions(
////                                  const NotificationSettingsIos(
////                                      sound: true, badge: true, alert: true))
////                                  .then((_) {
////                                // when finished, check the permission status
//
////                              });
//                          NotificationPermissions.requestNotificationPermissions(
//                                  openSettings: true, iosSettings: NotificationSettingsIos(badge: true, sound: true, alert: true))
//                              .then((_) {
//                            setState(() {
//                              permissionStatusFuture = getCheckNotificationPermStatus();
//                            });
//                          });
//                        },
//                      )
//                    ],
//                  );
//                }
//                return Text("No permission status yet");
//              }),
//        )),
//      ),
//    );
//  }
//}
