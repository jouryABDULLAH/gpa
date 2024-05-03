import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cr_calendar/cr_calendar.dart';
import 'package:gpa/control.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/presentation/home/db.dart';
import 'package:gpa/presentation/notification/notification_screen.dart';
import '../../widgets/day_item_widget.dart';
import '../../widgets/event_widget.dart';
import '../../widgets/week_days_widget.dart';
import 'package:gpa/presentation/resources/color_manager.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

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
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: controller.getEvents(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 19),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const NotificationScreen()));
                            },
                            icon: const Icon(
                              Icons.notifications,
                              color: Color.fromARGB(255, 255, 198, 34),
                              size: 27,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 27),
                      SizedBox(
                        height: 255,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/try.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Center(
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/lolo.png'),
                                        height: 67,
                                      ),
                                    ),
                                    const SizedBox(height: 13),
                                    Text(
                                      "الاسم: ${controller.me?.name}" ?? "",
                                      style: GoogleFonts.tajawal(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "الرقم الجامعي: ${controller.me?.id}",
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
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 500,
                        height: 410,
                        child: Card(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Get.to(const Db());
                                  },
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
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.arrow_back_ios),
                                      color: ColorManager.primary,
                                      onPressed: () {
                                        controller.changeCalendarPage(
                                            showNext: false);
                                      },
                                    ),
                                    ValueListenableBuilder(
                                      valueListenable:
                                          controller.monthNameNotifier,
                                      builder: (context, value, child) => Text(
                                        value,
                                        style: GoogleFonts.getFont(
                                          MyLocal.getFontFamily(
                                              Get.locale!.languageCode),
                                          textStyle: const TextStyle(
                                            fontSize: 25,
                                            color: Color.fromARGB(
                                                255, 109, 109, 109),
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.arrow_forward_ios),
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
                                    controller: controller.calendarController,
                                    forceSixWeek: true,
                                    dayItemBuilder: (builderArgument) =>
                                        DayItemWidget(
                                      properties: builderArgument,
                                    ),
                                    weekDaysBuilder: (day) =>
                                        WeekDaysWidget(day: day),
                                    eventBuilder: (drawer) =>
                                        EventWidget(drawer: drawer),
                                    minDate: DateTime.now()
                                        .subtract(const Duration(days: 1000)),
                                    maxDate: DateTime.now()
                                        .add(const Duration(days: 180)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
