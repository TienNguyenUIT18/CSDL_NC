import 'package:flutter/material.dart';
import 'package:money_wise/core/helper/base_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class RoundBtn extends StatefulWidget {
  String? text;
  Color? fontColor;
  Color? bgColor;
  Size? size;
  Function? onTap;
  RoundBtn({
    super.key,
    this.text,
    this.fontColor,
    this.bgColor,
    this.size,
    this.onTap,
  });

  @override
  State<RoundBtn> createState() => _RoundBtnState();
}

class _RoundBtnState extends State<RoundBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.bgColor ?? BaseColor.primaryColor,
        // shape: const StadiumBorder(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: widget.size ??
            Size(
              100.w,
              40.h,
            ),
      ),
      child: Text(
        widget.text ?? "",
        style: TextStyle(color: widget.fontColor ?? Colors.white),
      ),
    );
  }
}
