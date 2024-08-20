class User {
  String? username;
  int? target;

  User({
    this.username,
    this.target,
  });

  User fromJson(Map<String, dynamic> json) {
    final user = User();
    if (isNotBlank(json["Name"])) {
      user.username = json["Name"];
    }
    if (isNotBlank(json["Target"])) {
      user.target = int.tryParse(json["Target"] ?? "0");
    }
    return user;
  }

  bool isNotBlank(String target) {
    if (target.isNotEmpty) {
      return true;
    }
    return false;
  }
}
