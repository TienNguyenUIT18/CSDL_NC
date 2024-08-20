import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_wise/core/helper/base_color.dart';

// ignore: must_be_immutable
class RoundTextInput extends StatefulWidget {
  String? hintText;
  Color? contentColors;
  TextEditingController controller;
  bool? showBorder;
  bool? isSecure;

  RoundTextInput({
    super.key,
    this.hintText,
    this.contentColors,
    required this.controller,
    this.showBorder,
    this.isSecure,
  });

  @override
  State<RoundTextInput> createState() => _RoundTextInputState();
}

class _RoundTextInputState extends State<RoundTextInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isSecure ?? false,
      controller: widget.controller,
      style: TextStyle(
        color: widget.contentColors ?? BaseColor.lightGrey,
      ),
      decoration: InputDecoration(
        
        border: widget.showBorder != null && widget.showBorder! == true
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: BaseColor.green,
                  width: 2.w,
                ),
              )
            : InputBorder.none,
        hintText: widget.hintText ?? "",
        hintStyle: TextStyle(
          color: BaseColor.lightGrey,
          fontSize: 16.sp,
        ),
        contentPadding: EdgeInsets.fromLTRB(16.w, 8.h, 4.h, 16.w),
      ),
    );
  }
}
