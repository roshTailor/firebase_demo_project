import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase authentication"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  final userCredential = await FirebaseAuth.instance.signInAnonymously();
                  print("Sign in temporary");
                } catch (error) {
                  print(error);
                }
              },
              child: const Text("Anonymous authentication"),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: "roshnitailor47@gmail.com", password: "rosh@1234");
                  print("Sign in permanent");
                } catch (error) {
                  print(error);
                }
              },
              child: const Text("Permanent authentication"),
            ),
          ],
        ),
      ),
    );
  }
}
