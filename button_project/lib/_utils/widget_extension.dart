import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:developer';

import 'package:flutter/foundation.dart';

dynamic showToast(
  String toastMsg, {
  Color? backgroundColor,
  bool longToast = false,
  ToastGravity? gravity,
}) {
  return Fluttertoast.showToast(
      msg: toastMsg,
      toastLength: longToast ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.CENTER,
      textColor: Colors.white,
      backgroundColor: backgroundColor ?? Colors.black,
      timeInSecForIosWeb: longToast ? 5 : 2);
}

extension StringExtension on String {
  void get logIt {
    if (kDebugMode) {
      log("LOG.IT ===> $this");
    }
  }
}
