// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo_project/Utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Helper/CollectionHelper.dart';
import '../Model/UserModel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile page"),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: [
          TextFormField(
            controller: AppController.name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter The Name",
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: AppController.age,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter The Age",
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            ),
          ),
          const SizedBox(height: 20),
          CupertinoButton.filled(
            child: const Text("Insert Data"),
            onPressed: () {
              var userData = UserData(
                  name: AppController.name.text,
                  age: int.parse(AppController.age.text));
              CollectionHelper.instance.insertData(userData);
              AppController.name.clear();
              AppController.age.clear();
            },
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 500,
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('Employee').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went Wrong!");
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      AppController.userData = snapshot.data!.docs;
                      return ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 0),
                        onTap: () => Navigator.pushNamed(context,'edit',arguments: index),
                        title: Text("${AppController.userData[index]['name']}"),
                        subtitle:
                            Text("${AppController.userData[index]['age']}"),
                        trailing: IconButton(
                          splashRadius: 25,
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            CollectionHelper.instance.deleteData(index: index);
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
