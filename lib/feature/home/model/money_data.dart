class MoneyData {
  String? timeStamp;
  String? amount;
  String? reason;

  MoneyData({
    this.timeStamp,
    this.amount,
    this.reason,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        "Amount": amount,
        "Reason": reason,
      };

  factory MoneyData.fromJson(Map<String, dynamic> json) => MoneyData(
        amount: json['Amount'] as String?,
        reason: json['Reason'] as String?,
      );
}
