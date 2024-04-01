// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? name;
  String? userName;
  String? email;
  String? id;
  String? password;
  GeoPoint? location;
  String? uId;
  String? short;
  String? token;
  int? photo;
  int? type;
  List? children;
  List? notification;

  UserModel({
    this.name,
    this.id,
    this.userName,
    this.email,
    this.password,
    this.location,
    this.uId,
    this.type,
    this.short,
    this.token,
    this.photo,
    this.children,
    this.notification,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String uId, String stringAsFixed) {
    return UserModel(
      name: json["name"],
      id: json["id"],
      uId: uId,
      email: json["email"],
      children: json["children"],
      photo: json["photo"],
      token: json["token"],
      type: json["type"],
      notification: json["notification"],
      password: json["password"],

    );
  }





  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'id': id,
    };
  }
//
}
