import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:money_wise/core/helper/base_color.dart';
import 'package:money_wise/core/extension/ui/core_page.dart';
import 'package:money_wise/core/extension/ui/round_btn.dart';
import 'package:money_wise/core/extension/ui/round_text_input.dart';
import 'package:money_wise/feature/home/ui/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todayTotal = 0;
  final reasonInp = TextEditingController();
  final amountInp = TextEditingController();

  final viewModel = Get.put(HomePageViewModel());

  @override
  void initState() {
    viewModel.getTodayUsed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CorePage(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 64.h,
              ),
              Center(
                child: Text(
                  "Xin chào,",
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Tien Nguyen",
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Center(
                child: Text(
                  "Hoạt động hôm nay lúc",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "08:25 AM",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(
                height: 24.h,
              ),
              Center(
                child: Text(
                  "Số giờ làm việc hôm nay",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300.h,
                      height: 300.h,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 295.h,
                            height: 295.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: 280.h,
                            height: 280.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: 260.h,
                            height: 260.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 235, 102, 93),
                            ),
                          ),
                          Container(
                            width: 240.h,
                            height: 240.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                "2h:11p",
                                style: TextStyle(
                                  fontSize: 60.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
