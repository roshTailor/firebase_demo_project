import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo_project/Helper/FirebaseHelper.dart';
import 'package:firebase_demo_project/Utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widget/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseHelper authInstance = FirebaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase authentication"),
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
            // ElevatedButton(
            //   onPressed: () => authInstance.authAnonymous(),
            //   child: const Text("Anonymous authentication"),
            // ),
            // ElevatedButton(
            //   onPressed: () => authInstance.authCreateUser(email: AppController.email.text, password: AppController.password.text),
            //   child: const Text("Create new user"),
            // ),
            // ElevatedButton(
            //   onPressed: () => authInstance.authSignInUser(email: AppController.email.text, password: AppController.password.text),
            //   child: const Text("Sign in"),
            // ),
            // ElevatedButton(
            //   onPressed: () => authInstance.authGoogle(),
            //   child: const Text("Log in with Google"),
            // ),
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
                authInstance.authCreateUser(email: AppController.email.text, password: AppController.password.text);
                Navigator.of(context).pushNamed("ProfilePage");
              },
              title: "Create new user",
            ),
            newButton(
              onPressed: () {
                authInstance.authSignInUser(email: AppController.email.text, password: AppController.password.text);
                Navigator.of(context).pushNamed("ProfilePage");
              },
              title: "Sign In",
            ),
            newButton(
                onPressed: () {
                  authInstance.authGoogle();
                  Navigator.of(context).pushNamed("ProfilePage");
                },
                title: "Log in with Google")
          ],
        ),
      ),
    );
  }
}
