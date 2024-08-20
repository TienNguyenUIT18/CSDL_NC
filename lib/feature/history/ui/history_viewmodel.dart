import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_wise/core/helper/base_const.dart';
import 'package:money_wise/feature/history/model/history.dart';
import 'package:money_wise/feature/home/model/money_data.dart';
import 'package:money_wise/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPageViewModel extends GetxController {
  final _history = RxList<HistoryData?>([]);

  List<HistoryData?> get histories {
    _history.value.sort((a, b) {
      final aMonth = int.tryParse(a!.monthId!.split("-")[0]) ?? 0;
      final bMonth = int.tryParse(b!.monthId!.split("-")[0]) ?? 0;
      final aYear = int.tryParse(a.monthId!.split("-")[1]) ?? 0;
      final bYear = int.tryParse(b.monthId!.split("-")[1]) ?? 0;
      if (aYear == bYear) {
        return aMonth.compareTo(bMonth);
      } else {
        return aYear.compareTo(bYear);
      }
    });
    return _history.reversed.toList();
  }

  ScrollController historyScrollCtrl = ScrollController();

  final _gateway = injector<FirebaseFirestore>().collection(BaseConst.userCollection);
  final _sprefs = injector<SharedPreferences>();

  Future<QuerySnapshot<Map<String, dynamic>>> getTotalOfMonth(String month, String day) async {
    final call = _gateway
        .doc(_sprefs.getString(
          SprefsKeys.username,
        ))
        .collection(
          BaseConst.dataCollection,
        )
        .doc(
          month,
        )
        .collection(
          day,
        );
    final data = await call.get();
    return data;
  }

  Future<void> getAllMonth() async {
    try {
      _history.clear();
      final call = _gateway
          .doc(_sprefs.getString(
            SprefsKeys.username,
          ))
          .collection(
            BaseConst.dataCollection,
          );
      await call.get().then((response) async {
        if (response.docs.isNotEmpty) {
          List<HistoryData> temp = [];
          response.docs.forEach((element) async {
            final listDate = element.data()["Data"].toString().split("_");
            listDate.removeWhere((element) => element.isEmpty);
            listDate.sort();
            final history = HistoryData(monthId: element.id, availableDate: listDate, moneyData: []);
            var total = 0;
            for (var day in listDate) {
              final monthData = await getTotalOfMonth(element.id, day);
              final dayUsed = UsedMoneyData(date: day, moneyData: []);
              for (int i = 0; i < monthData.docs.length; i++) {
                final usedDay = MoneyData.fromJson(monthData.docs[i].data());
                total += int.tryParse(usedDay.amount ?? "0") ?? 0;
                dayUsed.moneyData!.add(usedDay);
              }
              history.moneyData!.add(dayUsed);
            }
            print("==== ${history.monthId} $total");
            history.totalUsed = total;
            _history.add(history);
          });
        }
      });
    } catch (e) {
      print("===== $e");
    }
  }
}
