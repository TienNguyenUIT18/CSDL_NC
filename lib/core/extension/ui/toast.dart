import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BaseUI {
  static void showToast({String? message, Color? textColor, int? fontSize}) {
    Fluttertoast.showToast(
        msg: message ?? "",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: textColor ?? Colors.white,
        fontSize: fontSize?.sp ?? 16.sp);
  }
}
