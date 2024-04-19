import 'package:cr_calendar/cr_calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/control.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/presentation/home/db.dart';
import '../../widgets/day_item_widget.dart';
import '../../widgets/event_widget.dart';
import '../../widgets/week_days_widget.dart';
import 'package:gpa/presentation/resources/color_manager.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill)),
        child: FutureBuilder(
          future: controller.getEvents(),
          builder: (co, da) => da.hasData
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 19,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.notifications,
                              color: Color.fromARGB(255, 255, 198, 34),
                              size: 27),
                        ],
                      ),
                      SizedBox(
                        height: 27,
                      ),
                      Expanded(
                        flex: 0,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 255,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    20), // Adjust the radius as needed
                                child: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/try.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Center(
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/lolo.png'),
                                              height: 67,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 13,
                                          ),
                                          Text(
                                            "الاسم: ${controller.me?.name}" ??
                                                "",
                                            style: GoogleFonts.tajawal(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            " الرقم الجامعي : ${controller.me?.id}",
                                            style: GoogleFonts.tajawal(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(children: [
                          SizedBox(height: 30),
                          SizedBox(
                            width: 500.0,
                            height: 410.0,
                            child: Card(
                              color: Color.fromARGB(255, 255, 255, 255),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      child: Text(
                                        "more".tr,
                                        style: GoogleFonts.getFont(
                                          MyLocal.getFontFamily(
                                              Get.locale!.languageCode),
                                          color: ColorManager.primary,
                                          decoration: TextDecoration.underline,
                                          fontSize: 16,
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.to(const Db());
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          icon:
                                              const Icon(Icons.arrow_back_ios),
                                          color: ColorManager.primary,
                                          onPressed: () {
                                            controller.changeCalendarPage(
                                                showNext: false);
                                          },
                                        ),
                                        ValueListenableBuilder(
                                          valueListenable:
                                              controller.monthNameNotifier,
                                          builder: (ctx, value, child) => Text(
                                            value,
                                            style: GoogleFonts.getFont(
                                              MyLocal.getFontFamily(
                                                  Get.locale!.languageCode),
                                              textStyle: TextStyle(
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 109, 109, 109),
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                              Icons.arrow_forward_ios),
                                          color: ColorManager.primary,
                                          onPressed: () {
                                            controller.changeCalendarPage(
                                                showNext: true);
                                          },
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: CrCalendar(
                                        firstDayOfWeek: WeekDay.monday,
                                        eventsTopPadding: 32,
                                        initialDate: controller.currentDate,
                                        maxEventLines: 3,
                                        controller:
                                            controller.calendarController,
                                        forceSixWeek: true,
                                        dayItemBuilder: (builderArgument) =>
                                            DayItemWidget(
                                                properties: builderArgument),
                                        weekDaysBuilder: (day) =>
                                            WeekDaysWidget(day: day),
                                        eventBuilder: (drawer) =>
                                            EventWidget(drawer: drawer),
                                        // onDayClicked: controller.showDayEventsInModalSheet(context),
                                        minDate: DateTime.now().subtract(
                                            const Duration(days: 1000)),
                                        maxDate: DateTime.now()
                                            .add(const Duration(days: 180)),
                                        // weeksToShow: [0,1,2].toList(),
                                        //localizedWeekDaysBuilder: (weekDay) => LocalizedWeekDaysWidget(weekDay: weekDay),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
