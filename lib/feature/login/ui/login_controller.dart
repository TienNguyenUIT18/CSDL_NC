import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_wise/core/helper/base_const.dart';
import 'package:money_wise/feature/dashboard/dashboard.dart';
import 'package:money_wise/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final _gateway = injector<FirebaseFirestore>().collection(BaseConst.userCollection);
  final _sprefs = injector<SharedPreferences>();
  var _username = "".obs;

  String get username => _username.value;

  Future<void> login(String username, String password) async {
    try {
      Get.offAll(const DashboardPage());
    } catch (e) {
      print(e);
    }
  }

  Future<void> autoLogin() async {
  }
}
