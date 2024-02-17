import 'package:cr_calendar/cr_calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/control.dart';
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
<<<<<<< HEAD
      body: FutureBuilder(
        future: controller.getEvents(),
        builder: (co, da) => da.hasData
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.list),
                        Icon(Icons.notifications),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 260, // Set a fixed height for the SizedBox
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/back_card.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Center(
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/logo.png'),
                                        height: 100,
                                      ),
                                    ),
                                    Text("Name: ${controller.me?.name}" ?? ""),
                                    const Text("University Number: #565652"),
                                  ],
                                ),
                              ),
                            ),
                          ),
=======
      body: Container(
        color: Color.fromARGB(255, 17, 53, 91),
        child: FutureBuilder(
          future: controller.getEvents(),
          builder: (co, da) => da.hasData
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Icon(Icons.list),
                          Icon(Icons.notifications,
                              color: Color.fromARGB(255, 255, 198, 34),
                              size: 25),
>>>>>>> origin/test
                        ],
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 500,
                          height: 100,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/back_card.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Directionality(
                                textDirection:
                                    TextDirection.rtl, // Add this line
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Center(
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/logo.png'),
                                        height: 110,
                                        alignment: Alignment.topRight,
                                      ),
                                    ),

                                    Text(
                                      "الاسم: ${controller.me?.name}" ?? "",
                                      style: GoogleFonts.almarai(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    // const

                                    Text(
                                      "الرقم الجامعي: #565652",
                                      style: GoogleFonts.almarai(
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
                      Expanded(
                        child: SizedBox(
                          width: 500.0,
                          child: Card(
                            color: Color.fromARGB(255, 255, 255, 255),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextButton(
                                    child: Text(
                                      "المزيد",
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
                                        icon: const Icon(Icons.arrow_back_ios),
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
                                        icon:
                                            const Icon(Icons.arrow_forward_ios),
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
                                      // onDayClicked: controller.showDayEventsInModalSheet(context),
                                      minDate: DateTime.now()
                                          .subtract(const Duration(days: 1000)),
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
