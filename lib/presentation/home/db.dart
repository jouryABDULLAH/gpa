import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cr_calendar/cr_calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa/control.dart';
import 'package:gpa/presentation/resources/color_manager.dart';

import '../../widgets/create_event_dialog.dart';
import '../../widgets/day_item_widget.dart';
import '../../widgets/event_widget.dart';
import '../../widgets/week_days_widget.dart';

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
          const Image(image: AssetImage("assets/images/app_bar.png")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              index == 0 ? Colors.white : null)),
                      child: const Text("List"),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              index == 1 ? Colors.white : null)),
                      child: const Text("Calender"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (index == 0)
            Expanded(
              // height: 500,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                    itemBuilder: (c, i) => Container(
                          decoration: BoxDecoration(
                              color: controller
                                  .calendarController.events?[i].eventColor,
                              borderRadius: BorderRadius.circular(80)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(controller
                                        .calendarController.events?[i].name ??
                                    ""),
                                CircleAvatar(
                                    radius: 30,
                                    child: Text(
                                        "${controller.calendarController.events?[i].begin.day} - ${controller.calendarController.events?[i].end.day}")),
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (pp, dd) => const SizedBox(
                          height: 10,
                        ),
                    itemCount:
                        controller.calendarController.events?.length ?? 0),
              ),
            ),

          /// Calendar control row.
          if (index == 1) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    controller.changeCalendarPage(showNext: false);
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: controller.monthNameNotifier,
                  builder: (ctx, value, child) => Text(
                    value,
                    style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
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
                eventsTopPadding: 32,
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
<<<<<<< HEAD
      floatingActionButton: FloatingActionButton(
=======
      /*  floatingActionButton: FloatingActionButton(
>>>>>>> HI
        onPressed: addEvent,
        backgroundColor: ColorManager.primary,
        child: const Icon(
          Icons.add,
          color: ColorManager.violet,
        ),
<<<<<<< HEAD
      ),
=======
      ),*/
>>>>>>> HI
    );
  }

  Future<void> addEvent() async {
    final event = await showDialog(
        context: context, builder: (context) => const CreateEventDialog());
    if (event != null) {
      setState(() {
        controller.calendarController.addEvent(event);
        // await FirebaseFirestore.instance.collection("events").add(data)
      });
      // print(event.eventColor.value);
      await FirebaseFirestore.instance.collection("events").add({
        "name": event.name,
        "begin": event.begin.toString().split(" ")[0],
        "end": event.end.toString().split(" ")[0],
        "color": event.eventColor.value,
      });
    }
  }
}
