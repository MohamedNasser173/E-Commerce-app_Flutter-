class UserModel {
  String? name = "", email = "", pic = "pic", userId = "";
  UserModel(
      {required this.userId,
      required this.email,
      required this.name,
      required this.pic});
  UserModel.fromjson(Map<dynamic, dynamic> map) {
    userId = map["UserId"];
    email = map["email"];
    name = map["name"];
    pic = map["pic"];
  }

  tojson() {
    return {
      'UserId': userId,
      'email': email,
      'name': name,
      'pic': pic,
    };
  }
}
