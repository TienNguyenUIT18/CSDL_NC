import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_wise/gen/assets.gen.dart';
import 'package:money_wise/core/helper/base_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_wise/core/extension/ui/round_btn.dart';
import 'package:money_wise/feature/login/ui/login_controller.dart';
import 'package:money_wise/core/extension/ui/round_text_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameInp = TextEditingController();
  final TextEditingController passwordInp = TextEditingController();

  final viewModel = Get.put(LoginController());
  @override
  void initState() {
    viewModel.autoLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Assets.resources.images.loginBackground.image(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 250.h, 0, 50.h),
                        child: SizedBox(
                          width: 200.w,
                          height: 50.h,
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(color: Color.fromARGB(255, 57, 43, 43), fontSize: 36.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 300.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Obx(() {
                              if (viewModel.username.isNotEmpty) {
                                usernameInp.text = viewModel.username;
                              }
                              return RoundTextInput(
                                hintText: "Username",
                                controller: usernameInp,
                              );
                            }),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Container(
                                height: 2.h,
                                color: Color.fromRGBO(155, 158, 251, 0.5),
                              ),
                            ),
                            RoundTextInput(
                              hintText: "Password",
                              controller: passwordInp,
                              isSecure: true,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20.h),
                        child: RoundBtn(
                          size: Size(300.w, 50.h),
                          bgColor: Color.fromRGBO(155, 158, 251, 1),
                          onTap: () {
                            viewModel.login(usernameInp.text, passwordInp.text);
                          },
                          text: "Login",
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
