import 'package:firebase_demo_project/Helper/FirebaseHelper.dart';
import 'package:firebase_demo_project/Utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../Widget/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseHelper authInstance = FirebaseHelper.instance;

  int counter = 0;

  showNotification() {
    setState(() {
      counter++;
    });
    flutterLocalNotificationsPlugin.show(
      0,
      "My notifiction $counter",
      "Hello",
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          importance: Importance.high,
          playSound: true,
          icon: "@mipmap/ic_launcher",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase authentication"),
        actions: [
          IconButton(
              onPressed: () {
                showNotification();
              },
              icon: const Icon(
                Icons.notifications_active,
              ),)
        ],
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 100),
            CupertinoTextField(
              controller: AppController.email,
              padding: const EdgeInsets.all(10),
              placeholder: "Email",
            ),
            const SizedBox(height: 20),
            CupertinoTextField(
              controller: AppController.password,
              padding: const EdgeInsets.all(10),
              obscureText: false,
              placeholder: "Password",
            ),
            const SizedBox(height: 100),
            newButton(
                onPressed: () {
                  try {
                    authInstance.authAnonymous();
                    Navigator.of(context).pushNamed("ProfilePage");
                  } catch (e) {
                    print(e);
                  }
                },
                title: "Anonymous authentication"),
            newButton(
              onPressed: () {
                authInstance.authCreateUser(
                    email: AppController.email.text,
                    password: AppController.password.text);
                Navigator.of(context).pushNamed("ProfilePage");
              },
              title: "Create new user",
            ),
            newButton(
              onPressed: () {
                authInstance.authSignInUser(
                    email: AppController.email.text,
                    password: AppController.password.text);
                Navigator.of(context).pushNamed("ProfilePage");
              },
              title: "Sign In",
            ),
            newButton(
                onPressed: () {
                  authInstance.authGoogle();
                  Navigator.of(context).pushNamed("ProfilePage");
                },
                title: "Log in with Google"),
            newButton(
              onPressed: () {
                Navigator.of(context).pushNamed("ProfilePage");
              },
              title: "Firebase collection",
            ),
            newButton(
              onPressed: () {},
              title: "Notification",
            ),
          ],
        ),
      ),
    );
  }
}
