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
                  "Hôm nay",
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Center(
                child: Obx(
                  () => Text(
                    "${viewModel.usedAmount} K",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
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
                          child: SizedBox(
                            width: 150.w,
                            height: 50.h,
                            child: TextField(
                              controller: amountInp,
                              showCursor: false,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.bold, color: BaseColor.primaryColor),
                              decoration: InputDecoration(
                                hintText: "+",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontSize: 48.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16.h),
                  width: 300.w,
                  child: RoundTextInput(
                    showBorder: true,
                    controller: reasonInp,
                    contentColors: Colors.white,
                    hintText: "Nội dung",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: RoundBtn(
                    onTap: () {
                      viewModel.insertPay(amountInp.text, reasonInp.text);
                      FocusScope.of(context).unfocus();
                      amountInp.clear();
                      reasonInp.clear();
                    },
                    text: "Lưu",
                    size: Size(100.w, 50.h),
                    bgColor: Colors.orange,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
