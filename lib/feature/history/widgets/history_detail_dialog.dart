import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:money_wise/core/helper/base_color.dart';
import 'package:money_wise/feature/history/model/history.dart';
import 'package:money_wise/feature/home/model/money_data.dart';

class HistoryDetailDialog extends StatefulWidget {
  List<UsedMoneyData>? details;
  HistoryDetailDialog({super.key, this.details});

  @override
  State<HistoryDetailDialog> createState() => _HistoryDetailDialogState();
}

class _HistoryDetailDialogState extends State<HistoryDetailDialog> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 24.w),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
          decoration: BoxDecoration(
            color: Color.fromRGBO(244, 246, 251, 1),
            borderRadius: BorderRadius.circular(
              16.r,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(48.r)),
                  child: Center(
                    child: Text(
                      "Lịch sử",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w900,
                        color: BaseColor.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.details?.length ?? 0,
                    itemBuilder: (context, i) {
                      final data = widget.details![i];
                      return Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          shadowColor: BaseColor.lightGrey,
                          elevation: 3.h,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                            child: Column(
                              children: [
                                Text(
                                  "Date: ${data.date}",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                    color: BaseColor.primaryColor,
                                  ),
                                ),
                                Container(
                                  height: 1.h,
                                  color: BaseColor.lightGrey,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.h),
                                  child: Column(
                                    children: generateData(
                                      data.moneyData ?? [],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> generateData(List<MoneyData?> data) {
  List<Widget> listWidget = [];
  int total = 0;
  for (var record in data) {
    if (record != null) {
      total += int.tryParse(record.amount ?? "0") ?? 0;
      listWidget.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              record.reason ?? "",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: BaseColor.lightGrey,
              ),
            ),
            Text(
              record.amount ?? "",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: BaseColor.pinkOrange,
              ),
            ),
          ],
        ),
      );
    }
  }
  listWidget.addAll(
    [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Container(
          height: 1.h,
          color: BaseColor.lightGrey,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Tổng",
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: BaseColor.purple,
              ),
          ),
          Text(
            "$total",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: BaseColor.fateOrange,
            ),
          ),
        ],
      )
    ],
  );
  return listWidget;
}
