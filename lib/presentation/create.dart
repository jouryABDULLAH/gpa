import '../../control.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa/shared/network/cache_helper.dart';

import 'home/home_screen.dart';

class Si {
  final controller = Get.put(Controller());
  Future submitAuthForm(
      {required String email,
      required String password,
      String? username,
      String? name,
      String? signWith,
      int? photo,
      required bool isLogin,
      required BuildContext ctx,
      int? type}) async {
    try {
      if (isLogin) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) async {
          bool i = await CacheHelper.saveData(
              key: 'uId', value: FirebaseAuth.instance.currentUser!.uid);
          if (i) {
            controller.uId = FirebaseAuth.instance.currentUser!.uid;
          }
          Navigator.of(ctx).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        });
      } else {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) async {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(value.user!.uid)
              .set({
            'email': email,
            'password': password,
            'name': name,
          }).then((valuee) async {
            bool i = await CacheHelper.saveData(
                key: 'uId', value: FirebaseAuth.instance.currentUser!.uid);
            if (i) {
              controller.uId = FirebaseAuth.instance.currentUser!.uid;
            }
            Navigator.of(ctx).pop();
            Navigator.of(ctx).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          });
        });
      }
    } on FirebaseAuthException catch (e) {
      String message = "error Occurred";
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }
      controller.ch();
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(ctx).colorScheme.error,
      ));
    } catch (e) {
      print(e);
    }
  }
}
