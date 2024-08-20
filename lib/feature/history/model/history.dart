import 'package:money_wise/feature/home/model/money_data.dart';

class HistoryData {
  String? monthId;
  int totalUsed = 0;
  List<String>? availableDate;
  List<UsedMoneyData>? moneyData;

  HistoryData({this.monthId, this.availableDate, this.totalUsed = 0, this.moneyData});
}

class UsedMoneyData {
  String? date;
  List<MoneyData?>? moneyData = [];

  UsedMoneyData({this.date, this.moneyData});
}
