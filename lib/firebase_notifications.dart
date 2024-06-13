// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
//
// import 'package:base_project/core/pusher.dart';
// import 'package:base_project/core/services/server_gate.dart';
// import 'package:base_project/models/user.dart';
// import 'package:base_project/shared/colors.dart';
// import 'package:base_project/views/chat/view.dart';
// import 'package:base_project/views/notifications/view.dart';
// import 'package:firebase_core/firebase_core.dart' as core;
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// import '../../main.dart';
// import 'core/utils/dio_helper.dart';
// import 'features/authentication/data/models/user_model.dart';
// import 'features/notifactions_view/presentation/views/notifactions_view.dart';
//
// class GlobalNotification {
//   Future<String> getFcmToken() async {
//     String deviceToken = (await FirebaseMessaging.instance.getToken())!;
//     updateFcm();
//     Prefs.setString(
//         "device_token", (await FirebaseMessaging.instance.getToken())!);
//
//     log('firebase token => $deviceToken  <<<<<<<<<');
//
//     return deviceToken;
//   }
//
//   static int chatId = 0;
//
//   static bool isGroup = false;
//
//   updateFcm() async {
//     String _oldDeviceToken = Prefs.getString('device_token') ?? "";
//     String _deviceToken = await FirebaseMessaging.instance.getToken() ?? "";
//
//     if (UserModel.i.isAuth && _deviceToken != _oldDeviceToken) {
//       CustomResponse response =
//           await ServerGate.i.sendToServer(url: "update_fcm", body: {
//         "type": Platform.isAndroid ? "android" : "ios",
//         "device_token": _deviceToken,
//       });
//       if (response.statusCode == 200) {
//         log('<--------- Fcm was updated successfully --------> \x1B[32m $_deviceToken\x1B[0m');
//       }
//     }
//   }
//
//   late FirebaseMessaging _firebaseMessaging;
//
//   StreamController<Map<String, dynamic>> get notificationSubject {
//     return _onMessageStreamController;
//   }
//
//   void killNotification() {
//     _onMessageStreamController.close();
//   }
//
//   late FlutterLocalNotificationsPlugin _notificationsPlugin;
//
//   late Map<String, dynamic> _notifyMap;
//
//   Future<void> setUpFirebase() async {
//     getFcmToken();
//     FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//     core.Firebase.initializeApp();
//     _firebaseMessaging = FirebaseMessaging.instance;
//     _firebaseMessaging.setAutoInitEnabled(true);
//     FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//         alert: true, badge: true, sound: true);
//     // checkLastMessage();
//     firebaseCloudMessagingListeners();
//
//     _notificationsPlugin = FlutterLocalNotificationsPlugin();
//
//     _notificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//           alert: false,
//           badge: true,
//           sound: true,
//         );
//     var android = const AndroidInitializationSettings('@mipmap/ic_launcher');
//     var ios = const DarwinInitializationSettings(
//       defaultPresentBadge: true,
//       defaultPresentAlert: true,
//       defaultPresentSound: true,
//       requestSoundPermission: true,
//     );
//     var initSetting = InitializationSettings(android: android, iOS: ios);
//     _notificationsPlugin.initialize(initSetting,
//         onDidReceiveNotificationResponse: onSelectNotification);
//   }
//
//   Future<void> firebaseCloudMessagingListeners() async {
//     if (Platform.isIOS) iOSPermission();
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage data) {
//       log('on message -=-=-=-=-=-= ${data.data}');
//       _notifyMap = data.data;
//
//       String type = data.data["notify_type"] ?? "";
//
//       int _chatId = 0;
//
//       String senderName = '';
//       _onMessageStreamController.add(data.data);
//
//       if (type == "new_message") {
//         // log("----0-0-0-0-0-0-chat id run type ${_notifyMap["chat_id"].runtimeType}");
//         // log("----0-0-0-0-0-0-chat id   ${_notifyMap["chat_id"]}");
//         Map<String, dynamic> _sender =
//             jsonDecode(_notifyMap["sender_data"] ?? {});
//
//         _chatId = int.parse(_sender["id"].toString());
//         // chatId = int.parse(_sender["id"].toString());
//         senderName = _sender['first_name'] ?? '';
//
//         // _familyId = int.parse(_notifyMap["family_id"] ?? "0");
//         // _isGroup = _notifyMap["room"] != null;
//         log("--=-=-=-=-=  conversation  chat id is $_chatId   ,  senderName is $senderName");
//       }
//       // showNotification(data);
//
//       if (type == "new_message") {
//         if (chatId == _chatId) {
//           /// don't show fcm
//         } else {
//           unreadMessage.add("1");
//           initialChatCounter = "1";
//           showNotification(data);
//         }
//       } else {
//         showNotification(data);
//       }
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage data) {
//       log('on Opened ' + data.data.toString());
//
//       handleNotificationsRoute(data.data);
//     });
//   }
//
//   showNotification(
//     RemoteMessage data,
//   ) async {
//     //  log("Notification Response : $_message");
//     // log("-=-=-   map android  ${data.notification?.android?.toMap()}");
//     // log("-=-=- channelId     ---=-= ${data.notification?.android?.channelId}");
//     log("-=-=-   all data  ${data.toMap()}");
//
//     // print("-=-=-   apple map  ${data.notification?.apple?.toMap()}");
//     // print("-=-=-   all ios  ${data.notification}");
//     // log("-=-=-sound  link   ${data.notification?.android?.link}");
//     var androidX = AndroidNotificationDetails(
//         data.notification?.android?.channelId ?? "channel_id", 'channel_name',
//         channelDescription: 'channel_description',
//         priority: Priority.touch,
//         playSound: true,
//         //  sound: const RawResourceAndroidNotificationSound("notification_sound"),
//         sound: UriAndroidNotificationSound(data.notification?.android?.link ??
//             "https://commondatastorage.googleapis.com/codeskulptor-assets/week7-brrring.m4a"),
//         ticker: 'ticker',
//         icon: "@mipmap/ic_launcher",
//         enableVibration: true,
//         color: colorPrimary.withOpacity(.3),
//         enableLights: true,
//         importance: Importance.max);
//     var iost = const DarwinNotificationDetails(
//         presentSound: false, presentAlert: false, presentBadge: false
//
//         // sound: "https://commondatastorage.googleapis.com/codeskulptor-assets/week7-brrring.m4a",
//         // sound: data.notification?.apple?.sound?.toString(),
//         // presentSound: true,
//         );
//     var platform = NotificationDetails(android: androidX, iOS: iost);
//     await _notificationsPlugin.show(0, data.notification!.title ?? "",
//         data.notification!.body ?? "", platform,
//         payload: "");
//   }
//
//   void iOSPermission() {
//     _firebaseMessaging.requestPermission(
//       announcement: true,
//       badge: true,
//       sound: true,
//     );
//   }
//
//   onSelectNotification(NotificationResponse? onSelectNotification) async {
//     log("--------- Global Notification Logger --------> \x1B[37m------ payload -----\x1B[0m");
//     log('<--------- Global Notification Logger --------> \x1B[32m ${onSelectNotification?.notificationResponseType}\x1B[0m');
//
//     handleNotificationsRoute(_notifyMap);
//   }
// }
//
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage data) async {
//   log("Handling a background message: ${data.data}");
// }
//
// StreamController<Map<String, dynamic>> _onMessageStreamController =
//     StreamController.broadcast();
//
// String initialChatCounter = '0';
// StreamController<String> unreadMessage = StreamController.broadcast();
//
// void handleNotificationsRoute(Map<String, dynamic> map) {
//   String type = map["notify_type"].toString();
//   if (type == "new_message") {
//     Map<String, dynamic> _sender = jsonDecode(map["sender_data"] ?? {});
//
//     int _chatId = int.parse(_sender["id"].toString());
//     String senderName = _sender['first_name'] ?? '';
//     push(ChatDetailsScreen(
//         userId: _chatId, userName: senderName, backToHome: true));
//
//     log("--=-=-=-=-=  conversation  chat id is $_chatId   ,  senderName is $senderName");
//   } else {
//     push(const NotificationsView());
//   }
// }
