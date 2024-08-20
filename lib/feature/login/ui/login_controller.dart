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
      final DocumentSnapshot result = await _gateway.doc(username.toLowerCase()).get();
      Map<String, dynamic> response = result.data() as Map<String, dynamic>;
      print(response);
      if (response["Password"] == password) {
        _sprefs.setString(SprefsKeys.username, username);
        _sprefs.setString(SprefsKeys.password, password);
        Get.to(const DashboardPage());
      } else {
        Get.showSnackbar(GetSnackBar(
          title: "Đăng nhập thất bại",
          message: "Tài khoản mật khẩu không đúng",
          duration: const Duration(seconds: 3),
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> autoLogin() async {
    final usernameId = _sprefs.getString(SprefsKeys.username);
    final password = _sprefs.getString(SprefsKeys.password);
    print(usernameId);
    print(password);
    if (password != null && usernameId != null && password.isNotEmpty && usernameId.isNotEmpty) {
      login(usernameId, password);
    }
  }
}
