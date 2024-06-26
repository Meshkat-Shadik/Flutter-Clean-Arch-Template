import 'package:flutter/material.dart' show Colors;
import 'package:fluttertoast/fluttertoast.dart';

extension StringX on String {
  void toast(bool isSuccessful) {
    Fluttertoast.showToast(
      msg: this,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: isSuccessful ? Colors.deepPurple : Colors.red,
      textColor: Colors.white,
      fontSize: 13.0,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
