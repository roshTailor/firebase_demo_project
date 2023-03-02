import 'package:flutter/material.dart';

Widget newButton({required onPressed, required String title}) {
  return ElevatedButton(onPressed: onPressed, child: Text(title));
}
