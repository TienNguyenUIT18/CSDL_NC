import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_wise/core/helper/base_color.dart';
import 'package:money_wise/feature/history/model/history.dart';

class MonthCard extends StatelessWidget {
  const MonthCard({
    super.key,
    required this.month,
    required this.year,
    required this.history,
  });

  final int? month;
  final int? year;
  final HistoryData? history;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: SizedBox(
        height: 60.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Center(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tháng :",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: BaseColor.lightGrey,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Text(
                    "$month - $year",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w900,
                      color: BaseColor.purple,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  history!.totalUsed == 0 ? "N/A" : "${history?.totalUsed}",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                    color: BaseColor.orange,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
