import 'package:firebase_demo_project/Utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Helper/CollectionHelper.dart';
import '../Model/UserModel.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    AppController.name.text = AppController.userData[index]['name'];
    AppController.age.text = AppController.userData[index]['age'].toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 20),
          TextFormField(
            controller: AppController.name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Edit The Name",
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: AppController.age,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Edit The Age",
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            ),
          ),
          const SizedBox(height: 20),
          CupertinoButton.filled(
            child: const Text("Update Data"),
            onPressed: (){
              UserData userData = UserData(name: AppController.name.text, age: int.parse(AppController.age.text));
              CollectionHelper.instance.updateData(index: index, userData: userData);
              AppController.name.clear();
              AppController.age.clear();
            },
          ),
        ],
      ),
    );
  }
}
