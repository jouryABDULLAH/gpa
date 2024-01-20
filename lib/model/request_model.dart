import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RequestModel {
  final String time;
  final String userActiontime;
  final String id;
  final String name;
  final String category;
  final String title;
  final String body;
  final String? mainCategoryName;
  final Map<String, int>? acceptedCategoriesOfAll;
  final Map<String, int>? rejectedCategoriesOfAll;
  final bool isAccepted;

  RequestModel({
    required this.time,
    required this.userActiontime,
    required this.id,
    required this.name,
    required this.category,
    required this.title,
    required this.body,
    this.mainCategoryName,
    this.acceptedCategoriesOfAll,
    this.rejectedCategoriesOfAll,
    required this.isAccepted,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time,
      'userActiontime': userActiontime,
      'id': id,
      'name': name,
      'category': category,
      'title': title,
      'body': body,
      'isAccepted': isAccepted,
    };
  }

  factory RequestModel.fromMap(Map<String, dynamic> map) {
    return RequestModel(
      time: map['time'] as String,
      userActiontime: map['userActiontime'] ?? map['time'],
      id: map['id'] as String,
      name: map['name'] as String,
      category: map['category'] as String,
      title: map['title'] ?? "No title was provided",
      body: map['body'] ?? "No body was provided",
      isAccepted: map['isAccepted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestModel.fromJson(String source) =>
      RequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  RequestModel copyWith({
    String? time,
    String? userActiontime,
    String? id,
    String? name,
    String? category,
    String? title,
    String? body,
    String? mainCategoryName,
    Map<String, int>? acceptedCategoriesOfAll,
    Map<String, int>? rejectedCategoriesOfAll,
    bool? isAccepted,
  }) {
    return RequestModel(
      time: time ?? this.time,
      userActiontime: userActiontime ?? this.userActiontime,
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      title: title ?? this.title,
      body: body ?? this.body,
      mainCategoryName: mainCategoryName ?? this.mainCategoryName,
      acceptedCategoriesOfAll:
          acceptedCategoriesOfAll ?? this.acceptedCategoriesOfAll,
      rejectedCategoriesOfAll:
          rejectedCategoriesOfAll ?? this.rejectedCategoriesOfAll,
      isAccepted: isAccepted ?? this.isAccepted,
    );
  }

  @override
  String toString() {
    return '''
  time: $time
  userActiontime: $userActiontime
  id: $id
  name: $name
  category: $category
  title:  $title
  body: $body
  mainCategoryName:  $mainCategoryName
  acceptedCategoriesOfAll:  $acceptedCategoriesOfAll
  rejectedCategoriesOfAll:  $rejectedCategoriesOfAll
  isAccepted: $isAccepted
    ''';
  }
}
