import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cr_calendar/cr_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:gpa/control.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/presentation/home/home_widget.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cubit/send_alarm_cubit.dart';
import '../../widgets/create_event_dialog.dart';
import '../../widgets/day_item_widget.dart';
import '../../widgets/event_widget.dart';
import '../../widgets/week_days_widget.dart';
import 'package:timezone/timezone.dart' as tz;

class Db extends StatefulWidget {
  const Db({super.key});

  @override
  State<Db> createState() => _DbState();
}

class _DbState extends State<Db> {
  int index = 0;
  final controller = Get.put(Controller());

  @override
  void initState() {
    controller.setTexts(
        controller.currentDate.year, controller.currentDate.month);
    controller.createExampleEvents();
    super.initState();
  }

  @override
  void dispose() {
    // controller.calendarController.dispose();
    // controller.appbarTitleNotifier.dispose();
    // controller.monthNameNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Upper(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 1,
              ),
              decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(23)),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        if (mounted) {
                          setState(() {
                            index = 0;
                          });
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(index == 0
                              ? const Color.fromARGB(118, 219, 219, 219)
                              : null)),
                      child: Text(
                        "List".tr,
                        style: GoogleFonts.getFont(
                          fontSize: 24,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          MyLocal.getFontFamily(Get.locale!.languageCode),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        if (mounted) {
                          setState(() {
                            index = 1;
                          });
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(index == 1
                              ? const Color.fromARGB(118, 219, 219, 219)
                              : null)),
                      child: Text(
                        "Calendar".tr,
                        style: GoogleFonts.getFont(
                          fontSize: 24,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          MyLocal.getFontFamily(Get.locale!.languageCode),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 0,
          ),
          if (index == 0)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.separated(
                  itemBuilder: (context, i) => Container(
                    decoration: BoxDecoration(
                      color:
                          controller.calendarController.events?[i].eventColor,
                      borderRadius: BorderRadius.circular(77),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            // Wrap with Flexible
                            child: Text(
                              textAlign: TextAlign.center,
                              style: GoogleFonts.getFont(
                                fontSize: 14,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                MyLocal.getFontFamily(Get.locale!.languageCode),
                              ),
                              overflow:
                                  TextOverflow.ellipsis, // Handle overflow
                              maxLines: 1, // Limit max lines
                              controller.calendarController.events?[i].name ??
                                  "",
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: const Color.fromARGB(240, 255, 255, 255),
                            radius: 32,
                            child: Text(
                              textAlign: TextAlign.center,
                              style: GoogleFonts.getFont(
                                color: const Color.fromARGB(255, 1, 116, 118),
                                fontSize: 16,
                                MyLocal.getFontFamily(Get.locale!.languageCode),
                              ),
                              "${controller.calendarController.events?[i].begin.day} - ${controller.calendarController.events?[i].end.day}",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemCount: controller.calendarController.events?.length ?? 0,
                ),
              ),
            ),

          /// Calendar control row.
          if (index == 1) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: ColorManager.primary,
                  onPressed: () {
                    controller.changeCalendarPage(showNext: false);
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: controller.monthNameNotifier,
                  builder: (ctx, value, child) => Text(
                    value,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 109, 109, 109),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  color: ColorManager.primary,
                  onPressed: () {
                    controller.changeCalendarPage(showNext: true);
                  },
                ),
              ],
            ),

            /// Calendar view.
            Expanded(
              child: CrCalendar(
                firstDayOfWeek: WeekDay.sunday,
                eventsTopPadding: 30,
                initialDate: controller.currentDate,
                maxEventLines: 3,
                controller: controller.calendarController,
                forceSixWeek: true,
                dayItemBuilder: (builderArgument) =>
                    DayItemWidget(properties: builderArgument),
                weekDaysBuilder: (day) => WeekDaysWidget(day: day),
                eventBuilder: (drawer) => EventWidget(drawer: drawer),
                // onDayClicked: controller.showDayEventsInModalSheet(context),
                minDate: DateTime.now().subtract(const Duration(days: 1000)),
                maxDate: DateTime.now().add(const Duration(days: 180)),
                // weeksToShow: [0,1,2].toList(),
                //localizedWeekDaysBuilder: (weekDay) => LocalizedWeekDaysWidget(weekDay: weekDay),
              ),
            ),
          ],
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addEvent,
        backgroundColor: ColorManager.primary,
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 255, 198, 34),
        ),
      ),
    );
  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> _zonedScheduleNotification(
      String name, String duration, DateTime dateEnd) async {
    final android = AndroidNotificationDetails(
      "${DateTime.now()}",
      "Default",
      priority: Priority.high,
      importance: Importance.max,
      shortcutId: DateTime.now().toIso8601String(),
    );
    const ios = DarwinNotificationDetails();
    final platform = NotificationDetails(android: android, iOS: ios);
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        name,
        duration,
        tz.TZDateTime.now(tz.local).add(dateEnd.difference(DateTime.now())),
        platform,
        androidScheduleMode: AndroidScheduleMode.inexact,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  /*  await FirebaseFirestore.instance
        .collection("notifications")
        .add({"eventName": name, "start": duration,});*/
  }

  Future<void> addEvent() async {
    final event = await showDialog(
        context: context, builder: (context) => const CreateEventDialog());
    if (event != null) {
      if (mounted) {
        setState(() {
          controller.calendarController.addEvent(event);
        });
      }
      await FirebaseFirestore.instance.collection("events").add({
        "name": event.name,
        "begin": event.begin.toString().split(" ")[0],
        "end": event.end.toString().split(" ")[0],
        "color": event.eventColor.value,
      });
      await SendAlarmCubit.get(context).sendNotification(
          event.name,
          "Start ${event.begin.toString().split(" ")[0]} : End ${event.end.toString().split(" ")[0]}",
          "event");

      await FirebaseFirestore.instance.collection("notifications").add({
        "eventName": event.name,
        "start": "Start :${event.begin.toString().split(" ")[0]}",
        "end": "End :${event.end.toString().split(" ")[0]}"
      });
      _zonedScheduleNotification(
          event.name,
          "Start ${event.begin.toString().split(" ")[0]}: End ${event.end.toString().split(" ")[0]}",
          (event.end as DateTime).subtract(const Duration(days: 1)));
    }
  }

  Widget Upper() {
    return Container(
      padding: const EdgeInsets.only(
        left: 0,
        right: 0,
      ),
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 168, 171),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(75, 0, 0, 0), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 10, // Blur radius
            offset: Offset(0, 4), // Offset of the shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25.0,
              ),
              padding: const EdgeInsets.all(0),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Acadmic".tr,
              style: GoogleFonts.getFont(
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                  textStyle: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
