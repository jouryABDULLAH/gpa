import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cr_calendar/cr_calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa/presentation/logIn/login_screen.dart';
import 'package:gpa/presentation/resources/constants.dart';
import 'package:gpa/presentation/resources/extensions.dart';
import 'package:gpa/widgets/create_event_dialog.dart';
import 'package:gpa/widgets/day_events_bottom_sheet.dart';
import 'model/user_model.dart';
import 'shared/network/cache_helper.dart';

class Controller extends GetxController {
  TextEditingController titleController = TextEditingController();
  var listFriends = [].obs;
  var messageDay = 0.obs;
  var distance = 0.obs;
  var listMyGroups = [].obs;
  var listOtherGroups = [].obs;
  var notificationSent = [].obs;
  var notificationReceive = [].obs;
  bool isLoading = false;
  bool isLoadingGoogle = false;
  bool isAddChild = false;
  bool isLoadingAdd = false;
  String uId = "";
  var events = [].obs;

  final currentDate = DateTime.now();
  final appbarTitleNotifier = ValueNotifier<String>('');
  final monthNameNotifier = ValueNotifier<String>('');

  CrCalendarController calendarController = CrCalendarController();

  // String local = CacheHelper.getDate(key: 'local');
  ch() {
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  UserModel? me;
  var children = [].obs;
  TextEditingController message = TextEditingController();
  TextEditingController url = TextEditingController();

  void changeIsLoadingGoogle() {
    isLoadingGoogle = !isLoadingGoogle;
    update();
  }

  void changeIsLoadingAdd() {
    isLoadingAdd = !isLoadingAdd;
    update();
  }

  void changeIsAddChild() {
    isAddChild = !isAddChild;
    update();
  }

  Future getMe() async {
    var ol = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    me = (UserModel.fromJson(
        ol.data()!, FirebaseAuth.instance.currentUser!.uid, ""));
    update();
    //
    // me?.children?.add(ol.data()?["children"]);
    return me;
  }
// <<<<<<< HEAD

//   Future getEvents() async {
//     events.clear();
//     var ol = await FirebaseFirestore.instance.collection('events').get();
//     for (var element in ol.docs) {
//       var begin = element["begin"].toString().split("-");
//       var end = element["end"].toString().split("-");
//       events.add(CalendarEventModel(
//           eventColor: Color(element["color"]),
//           name: element["name"],
//           begin: DateTime(
//               int.parse(begin[0]), int.parse(begin[1]), int.parse(begin[2])),
//           end: DateTime(
//               int.parse(end[0]), int.parse(end[1]), int.parse(end[2]))));
// =======
  Future getEvents() async {
    events.clear();
    var ol = await FirebaseFirestore.instance.collection('events').get();
    for (var element in ol.docs) {
      var begin = element["begin"].toString().split("-");
      var end = element["end"].toString().split("-");
      events.add(CalendarEventModel(
          eventColor: Color(element["color"]),
          name: element["name"],
          begin: DateTime(
              int.parse(begin[0]), int.parse(begin[1]), int.parse(begin[2])),
          end: DateTime(
              int.parse(end[0]), int.parse(end[1]), int.parse(end[2]))));
    }
    return events;
  }

  Future logout(context) async {
    try {
      // await FirebaseMessaging.instance.deleteToken();
      await FirebaseAuth.instance.signOut();
      await CacheHelper.removeData(key: 'uId');
      await FirebaseMessaging.instance.unsubscribeFromTopic("event");
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LogInWidget()));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  /// Control calendar with arrow buttons.
  void changeCalendarPage({required bool showNext}) => showNext
      ? calendarController.swipeToNextMonth()
      : calendarController.swipeToPreviousPage();

  void onCalendarPageChanged(int year, int month) {
    setTexts(year, month);
  }

  /// Set app bar text and month name over calendar.
  Future<void> setTexts(int year, int month)async {
    final date = DateTime(year, month);
    appbarTitleNotifier.value =await date.format(kAppBarDateFormat);
    monthNameNotifier.value = await date.format(kMonthFormat);
  }

  /// Show current month page.
  void showCurrentMonth() {
    calendarController.goToDate(currentDate);
  }

  /// Show [CreateEventDialog] with settings for new event.
  Future<void> addEvent(context) async {
    final event = await showDialog(
        context: context, builder: (context) => const CreateEventDialog());
    if (event != null) {
      calendarController.addEvent(event);
    }
  }

  void createExampleEvents() {
    final now = currentDate;
    calendarController = CrCalendarController(
      onSwipe: onCalendarPageChanged,
      events: List.generate(
          events.length,
              (index) => CalendarEventModel(
              eventColor: events[index].eventColor,
              name: events[index].name,
              begin: events[index].begin,
              end: events[index].end)),
    );
  }

  void showDayEventsInModalSheet(
      List<CalendarEventModel> events, DateTime day, context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
        isScrollControlled: true,
        context: context,
        builder: (context) => DayEventsBottomSheet(
          events: events,
          day: day,
          screenHeight: MediaQuery.of(context).size.height,
        ));
  }

  Future<bool> changePassword(
      String currentPassword,
      String newPassword,
      BuildContext context,
      ) async {
    log("I've been called");
    if (currentPassword.isEmpty) return true;
    try {
      if (newPassword.isEmpty) return false;
      // Get the current user object from Firebase Authentication.
      final user = FirebaseAuth.instance.currentUser;

      // If the user is not signed in, return.
      if (user == null) {
        return false;
      }
      // Create a credential object with the user's current password.
      final credential = EmailAuthProvider.credential(
          email: user.email!, password: currentPassword);

      // Reauthenticate the user with their current password.
      await user.reauthenticateWithCredential(credential);

      // Update the user's password with the new password.
      await user.updatePassword(newPassword);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("wrong-password")));
      }
      return false;
    }
  }

  Future updateEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    print("+++++++++++++++++++++++++${FirebaseAuth.instance.currentUser!.uid}");
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (email.isNotEmpty) {
        await user!.reauthenticateWithCredential(
          EmailAuthProvider.credential(
            email: user.email!,
            password: "12345678", // Replace with actual password
          ),
        );
        // Update the email address
        await user.updateEmail(email);
        // Send a verification email
        await user.sendEmailVerification();
      }
      if (email.isEmpty) return;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        if (email.isNotEmpty) "email": email,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future updateName({
    required String userName,
    required BuildContext context,
  }) async {
    print("+++++++++++++++++++++++++${FirebaseAuth.instance.currentUser!.uid}");
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        if (userName.isNotEmpty) "name": userName,
      });
    } catch (e) {
      print(e.toString());
    }
  }
// =======
//           events: events,
//           day: day,
//           screenHeight: MediaQuery.of(context).size.height,
//         ));
//   }

// >>>>>>> HI
}