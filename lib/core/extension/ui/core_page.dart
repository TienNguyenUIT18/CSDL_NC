import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_wise/core/helper/base_color.dart';

class CorePage extends StatefulWidget {
  Widget body;
  CorePage({
    super.key,
    required this.body,
  });

  @override
  State<CorePage> createState() => _CorePageState();
}

class _CorePageState extends State<CorePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(255, 255, 255, 1),
                  Color.fromRGBO(231, 160, 160, 1),
                  Color.fromRGBO(254, 169, 169, 1),
                ],
                stops: [0.2, 0.5, 0.85],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 16.h, top: 16.h, right: 16.h),
                  child: widget.body,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
