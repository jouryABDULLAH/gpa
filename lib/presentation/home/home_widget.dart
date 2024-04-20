import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/control.dart';
import 'package:gpa/presentation/home/db.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import '../../widgets/day_item_widget.dart';
import '../../widgets/event_widget.dart';
import '../../widgets/week_days_widget.dart';
import 'package:cr_calendar/cr_calendar.dart';

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
            image: AssetImage("assets/images/Sign_up_page.png"),
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 19),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.notifications,
                            color: Color.fromARGB(255, 255, 198, 34),
                            size: 25,
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Container(
                        height: 260,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/back_card.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  height: 100,
                                ),
                              ),
                              Text(
                                "الاسم: ${controller.me?.name}" ?? "",
                                style: GoogleFonts.almarai(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                " الرقم الجامعي : ${controller.me?.id}",
                                style: GoogleFonts.almarai(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 350,
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
                                    style: GoogleFonts.almarai(
                                      color: Color.fromRGBO(0, 168, 171, 1),
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
                                      icon: Icon(Icons.arrow_back_ios),
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
                                        style: GoogleFonts.poppins(
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
                                      icon: Icon(Icons.arrow_forward_ios),
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
                                            properties: builderArgument),
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
