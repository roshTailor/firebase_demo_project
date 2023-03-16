
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo_project/screen/EditProfile.dart';
import 'package:firebase_demo_project/screen/HomePage.dart';
import 'package:firebase_demo_project/screen/profilePage.dart';
import 'package:firebase_demo_project/screen/updaterProfile.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'ProfilePage': (context) => const ProfilePage(),
        'edit':(context)=> const EditProfile(),
        'update':(context)=> const UpdateProfile(),
      },
    ),
  );
}
