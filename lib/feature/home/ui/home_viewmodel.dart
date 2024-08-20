import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:money_wise/core/helper/base_const.dart';
import 'package:money_wise/feature/home/model/money_data.dart';
import 'package:money_wise/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageViewModel extends GetxController {
  final _usedAmount = 0.0.obs;

  int get usedAmount => _usedAmount.value.toInt();

  final _gateway =
      injector<FirebaseFirestore>().collection(BaseConst.userCollection);
  final _sprefs = injector<SharedPreferences>();

  Future<void> insertPay(String amount, String reason) async {

  }

  void onAppendRecord(
      DocumentReference<Map<String, dynamic>> gateway, MoneyData data) async {

  }

  Future<void> getTodayUsed() async {

  }
}
