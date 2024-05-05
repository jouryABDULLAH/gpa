import 'package:cloud_firestore/cloud_firestore.dart';

class ChildrenModel {
  String? name;
  String? address;
  String? level;
  String? email;
  String? busNumber;
  Map? status;
  String? photo;
  String? password;
  String? signWith;
  GeoPoint? location;
  String? uId;
  String? short;
  String? token;
  List? children;
  List? myGroups;
  bool? myShow;
  List? notification;
  String? distance;
  String? lastMessage;
  int? countMessage;
  int countUnread;
  Timestamp? lastUpdateUser;

  ChildrenModel({
    this.name,
    this.address,
    this.level,
    this.email,
    this.status,
    this.busNumber,
    this.password,
    this.signWith,
    this.location,
    this.uId,
    this.short,
    this.token,
    this.photo,
    this.children,
    this.myGroups,
    this.myShow,
    this.notification,
    this.distance,
    this.lastMessage,
    this.countMessage,
    this.countUnread = 0,
    this.lastUpdateUser,
  });

  factory ChildrenModel.fromJson(
      Map<String, dynamic> json, String uId, String stringAsFixed) {
    return ChildrenModel(
      name: json["name"],
      uId: uId,
      // distance: stringAsFixed,
      address: json["address"],
      level: json["class"],
      status: json["status"],
      busNumber: json["busNumber"],
      photo: json["photo"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
    };
  }
//
}
