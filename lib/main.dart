import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_wise/injector.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_wise/feature/login/ui/login_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:overlay_support/overlay_support.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjector();
  await Firebase.initializeApp(
    name: "money-wise",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => OverlaySupport.global(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          transitionDuration: const Duration(milliseconds: 200),
          title: "Money Wise",
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: FlutterEasyLoading(child: child),
            );
          },
          home: LayoutBuilder(
            builder: (context, _) {
              return const LoginPage();
            },
          ),
        ),
      ),
    );
  }
}
