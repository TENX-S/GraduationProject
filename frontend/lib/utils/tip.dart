import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/utils/styles.dart';

void showTip({required String msg, ToastGravity gravity = ToastGravity.BOTTOM}) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: gravity,
    backgroundColor: AppColor.tipBackground,
    textColor: AppColor.tipText,
  );
}
