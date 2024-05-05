class GroupsModel {
  String? title;
  List? users;
  String? counter;
  String? short;
  String? uId;
  bool? private;

  GroupsModel({
    this.title,
    this.counter,
    this.short,
    this.uId,
    this.private,
    this.users,
  });

  factory GroupsModel.fromJson(Map<String, dynamic> json, String trim) {
    return GroupsModel(
      title: json["title"],
      uId: trim,
      counter: json["counter"].toString(),
      users: json["users"],
      private: json["private"],
      short: json["short"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'counter': counter,
      'uId': uId,
      'users': users,
      'private': private,
    };
  }
}
