import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/model/student_plan_model.dart';
import 'package:gpa/presentation/Servecis/ProgramPlan/widgets/status_button.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:gpa/presentation/Servecis/ProgramPlan/widgets/segment_button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class plan extends StatefulWidget {
  const plan({super.key});

  @override
  State<plan> createState() => _planState();
}

class _planState extends State<plan> {
  StudentPlanModel? studentPlan;
  bool isPlanCompletion = true;
  var totalHours = 149;
  var electivesTotalHours = 6;
  var freeTotalHours = 6;
  int stdCsElectiveHrs = 0;
  int stdTotalHrs = 0;
  int stdFreeHrs = 0;
  int stdNoneCsElectiveHrs = 0;
  late List<StdHours> _studentHoursChartData;
  late TooltipBehavior _TooltipBehavior;
  @override
  void initState() {
    fetchStudentPlanData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110.0),
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.primary,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(75, 0, 0, 0),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: AppBar(
              elevation: 0,
              toolbarHeight: 99.0,
              title: Text(
                "student plan".tr,
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                  textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              centerTitle: true,
              backgroundColor: ColorManager.primary,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              actions: [],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 18.0, left: 18.0, right: 18.0),
            child: Column(
              children: [
                Container(
                  height: media.width * 1.0,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 118, 192, 184)
                          .withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                        // topLeft: Radius.circular(12),
                        // topRight: Radius.circular(12)
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 315,
                            child: SfCircularChart(
                              title: ChartTitle(
                                text: 'Plan progress'.tr,
                                textStyle: TextStyle(
                                  fontFamily: GoogleFonts.getFont(
                                          MyLocal.getFontFamily(
                                              Get.locale!.languageCode))
                                      .fontFamily,
                                ),
                              ),
                              legend: const Legend(
                                  isVisible: true,
                                  overflowMode: LegendItemOverflowMode.wrap,
                                  position: LegendPosition.bottom,
                                  textStyle: TextStyle(
                                    fontSize: 10.96,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  iconHeight: Checkbox.width * 1.0,
                                  iconWidth: Checkbox.width * 1.0),
                              tooltipBehavior: _TooltipBehavior,
                              series: <CircularSeries>[
                                RadialBarSeries<StdHours, String>(
                                  dataSource: _studentHoursChartData,
                                  pointColorMapper: (StdHours data, _) =>
                                      data.color,
                                  xValueMapper: (StdHours data, _) =>
                                      data.hrsType,
                                  yValueMapper: (StdHours data, _) => data.hrs,
                                  enableTooltip: true,
                                  maximumValue: totalHours.toDouble(),
                                  gap: '1.7',
                                  radius: '85',
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: StatusButton(
                                  title: "totalhours".tr,
                                  value: '$stdTotalHrs',
                                  statusColor:
                                      const Color.fromARGB(255, 21, 163, 195),
                                  onPressed: () {},
                                ),
                              ),
                              Expanded(
                                child: StatusButton(
                                  title: "collegehours".tr,
                                  value: '$stdNoneCsElectiveHrs',
                                  statusColor:
                                      const Color.fromARGB(255, 170, 48, 236),
                                  onPressed: () {},
                                ),
                              ),
                              Expanded(
                                child: StatusButton(
                                  title: "CShours".tr,
                                  value: '$stdCsElectiveHrs',
                                  statusColor:
                                      const Color.fromARGB(255, 220, 53, 173),
                                  onPressed: () {},
                                ),
                              ),
                              Expanded(
                                child: StatusButton(
                                  title: "free hours".tr,
                                  value: '$stdFreeHrs',
                                  statusColor:
                                      Color.fromARGB(255, 27, 188, 118),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ]),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 118, 192, 184)
                              .withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Expanded(
                          child: SegmentButton(
                              title: "plan completion".tr,
                              isActive: isPlanCompletion,
                              onPressed: () {
                                if (mounted) {
                                  setState(() {
                                    isPlanCompletion = !isPlanCompletion;
                                  });
                                }
                              })),
                      Expanded(
                          child: SegmentButton(
                              title: "plan details".tr,
                              isActive: !isPlanCompletion,
                              onPressed: () {
                                if (mounted) {
                                  setState(() {
                                    isPlanCompletion = !isPlanCompletion;
                                  });
                                }
                              }))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget buildPlanListView() {
    return ListView.builder(
      itemCount: studentPlan!.levels.length,
      itemBuilder: (context, index) {
        var level = studentPlan!.levels.keys.toList()[index];
        var courses = studentPlan!.levels[level];
        return Column(
          children: [
            Text(
              'Level: $level'.tr,
              style: const TextStyle(color: Colors.blue),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: courses!.length,
              itemBuilder: (context, index) {
                var course = courses[index];
                return ListTile(
                  title: Text(
                    course.name,
                    style: GoogleFonts.getFont(
                        MyLocal.getFontFamily(Get.locale!.languageCode),
                        color: Colors.black),
                  ),
                  subtitle: Text(
                    course.status,
                    style: GoogleFonts.getFont(
                        MyLocal.getFontFamily(Get.locale!.languageCode),
                        color: Colors.black),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void fetchStudentPlanData() async {
    try {
      StudentPlanModel studentPlanInfo =
          await StudentPlanModel.loadStudentPlan();

      if (mounted) {
        setState(() {
          studentPlan = studentPlanInfo;
        });
      }
      printData();
      setStdHrs();
      _studentHoursChartData = getStdHrs();
      _TooltipBehavior = TooltipBehavior(enable: true);
    } catch (e) {
      print("Error loading student plan data: $e");
    }
  }

  printData() {
    studentPlan?.levels.forEach((level, courses) {
      print('Level: $level'.tr);
      for (var course in courses) {
        print('Course: ${course.name}, Status: ${course.status}');
      }
    });
  }

  void setStdHrs() {
    if (studentPlan != null) {
      print(
          '\n\n\n\n\t---- vars before: $stdCsElectiveHrs, $stdFreeHrs, $stdNoneCsElectiveHrs, $stdTotalHrs ---- \n\n\n\n');
      studentPlan!.levels.forEach((level, courses) {
        for (var course in courses) {
          String? hours = course.hours;
          String type = course.type;

          if (hours != "--" &&
              hours.isNotEmpty &&
              course.status == "Taken and Completed".tr) {
            stdTotalHrs += int.parse(hours); // Increment instead of reassigning
          }

          if (type == 'free' &&
              hours != "--" &&
              hours.isNotEmpty &&
              course.status == "Taken and Completed".tr) {
            stdFreeHrs += int.parse(hours); // Increment instead of reassigning
          } else if (type == "CSelective" &&
              hours != "--" &&
              hours.isNotEmpty &&
              course.status == "Taken and Completed".tr) {
            stdCsElectiveHrs +=
                int.parse(hours); // Increment instead of reassigning
          } else if (type == "noneCSelective" &&
              hours != "--" &&
              hours.isNotEmpty &&
              course.status == "Taken and Completed".tr) {
            stdNoneCsElectiveHrs +=
                int.parse(hours); // Increment instead of reassigning
          }
        }
      });
      print(
          '\n\n\n\n\t----vars after: $stdCsElectiveHrs, $stdFreeHrs, $stdNoneCsElectiveHrs, $stdTotalHrs----\n\n\n\n');
    }
  }

  List<StdHours> getStdHrs() {
    List<StdHours> stdHrs = [
      StdHours("collegehours".tr, stdNoneCsElectiveHrs,
          const Color.fromARGB(255, 170, 48, 236)),
      StdHours("CShours".tr, stdCsElectiveHrs,
          const Color.fromARGB(255, 220, 53, 173)),
      StdHours(
          'free hours'.tr, stdFreeHrs, const Color.fromARGB(255, 27, 188, 118)),
      StdHours("totalhours".tr, stdTotalHrs,
          const Color.fromARGB(255, 21, 163, 195)),
    ];

    return stdHrs;
  }
}

class StdHours {
  StdHours(this.hrsType, this.hrs, this.color);
  String hrsType = '';
  int hrs = 0;
  Color color;
}
