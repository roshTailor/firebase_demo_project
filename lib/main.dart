import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo_project/screen/homePage.dart';
import 'package:firebase_demo_project/screen/profilePage.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      routes: {
        '/': (context) => const HomePage(),
        'ProfilePage': (context) => const ProfilePage(),
      },
    ),
  );
}
