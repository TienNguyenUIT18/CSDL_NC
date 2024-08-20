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
    final date = DateTime.now();
    try {
      final docTimeStamp =
          "${date.month < 10 ? "0${date.month}" : date.month}-${date.year}";
      final collectionDate =
          "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10 ? "0${date.month}" : date.month}-${date.year}";

      final pushData = MoneyData();
      pushData.amount = amount;
      pushData.reason = reason;

      final call = _gateway
          .doc(_sprefs.getString(
            SprefsKeys.username,
          ))
          .collection(
            BaseConst.dataCollection,
          )
          .doc(
            docTimeStamp,
          );
      call.get().then((response) {
        if (response.exists) {
          final savedData = response.data()!["Data"].toString();
          if (!savedData.split("_").contains(collectionDate)) {
            call.update({"Data": "$savedData${collectionDate}_"});
          }

          onAppendRecord(call, pushData);
        } else {
          call.set({"Data": "${collectionDate}_"});
          onAppendRecord(call, pushData);
        }
      });
    } catch (e) {
      print('========= FAILED: $e');
    }
  }

  void onAppendRecord(
      DocumentReference<Map<String, dynamic>> gateway, MoneyData data) async {
    final date = DateTime.now();
    final collectionDate =
        "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10 ? "0${date.month}" : date.month}-${date.year}";
    final timeDate =
        "${date.hour}:${date.minute}:${date.second < 10 ? "0${date.second}" : date.second}";
    data.timeStamp = "$collectionDate-$timeDate";
    final call = gateway.collection(collectionDate).doc(timeDate);
    call.get().then((value) {
      if (value.exists) {
        call.update({
          "Amount": data.amount,
          "Reason": data.reason,
        });
      } else {
        call.set({});
        call.update({
          "Amount": data.amount,
          "Reason": data.reason,
        });
      }
      getTodayUsed();
    });
  }

  Future<void> getTodayUsed() async {
    try {
      _usedAmount.value = 0;
      final date = DateTime.now();
      final docTimeStamp =
          "${date.month < 10 ? "0${date.month}" : date.month}-${date.year}";
      final collectionDate =
          "${date.day < 10 ? "0${date.day}" : date.day}-${date.month < 10 ? "0${date.month}" : date.month}-${date.year}";
      final call = _gateway
          .doc(_sprefs.getString(
            SprefsKeys.username,
          ))
          .collection(
            BaseConst.dataCollection,
          )
          .doc(
            docTimeStamp,
          )
          .collection(
            collectionDate,
          );
      call.get().then(
        (responseQuery) {
          responseQuery.docs.forEach((element) {
            final usedMoney = element.data()["Amount"];
            _usedAmount.value += double.tryParse(usedMoney.toString()) ?? 0.0;
          });
        },
      );
    } catch (e) {
      print("==== FAILED LOAD: $e");
    }
  }
}
