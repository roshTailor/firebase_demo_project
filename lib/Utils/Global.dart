import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AppController {
  static TextEditingController email = TextEditingController();
  static TextEditingController password = TextEditingController();
  static TextEditingController name = TextEditingController();
  static TextEditingController age = TextEditingController();
  static List userData = [];
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
AndroidNotificationChannel channel = const AndroidNotificationChannel(
  "my_channel",
  "Notification Channel",
  description: "This channel is used for important notification",
  importance: Importance.max,
);
