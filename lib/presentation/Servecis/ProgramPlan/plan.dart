import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/model/student_plan_model.dart';
import 'package:gpa/presentation/Servecis/ProgramPlan/widgets/level_progress_row.dart';
import 'package:gpa/presentation/Servecis/ProgramPlan/widgets/remaining_hrs_row.dart';
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
  bool isHrsRemaining = true;
  var totalHours = 149;
  var electivesTotalHours = 12;
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
              boxShadow: const [
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
              toolbarHeight: 90,
              title: Text(
                "student plan".tr,
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                    MyLocal.getFontFamily(Get.locale!.languageCode),
                    color: Colors.white,
                    fontSize: 30),
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
              actions: const [],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 15.0, left: 18.0, right: 18.0),
            child: Column(
              children: [
                Container(
                  height: media.width * 1.0,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 118, 192, 184)
                          .withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 318,
                            child: SfCircularChart(
                              title: ChartTitle(
                                text: "Plan progress".tr,
                                textStyle: TextStyle(
                                  fontFamily: GoogleFonts.getFont(
                                          MyLocal.getFontFamily(
                                              Get.locale!.languageCode))
                                      .fontFamily,
                                ),
                              ),
                              legend: Legend(
                                  isVisible: true,
                                  overflowMode: LegendItemOverflowMode.wrap,
                                  position: LegendPosition.bottom,
                                  textStyle: TextStyle(
                                    fontSize: Get.locale?.languageCode == 'ar'
                                        ? 10.96
                                        : 10,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  iconHeight: Checkbox.width * 1.1,
                                  iconWidth: Checkbox.width * 1.1),
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
                                      const Color.fromARGB(255, 27, 188, 118),
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
                              isActive: isHrsRemaining,
                              onPressed: () {
                                if (mounted) {
                                  setState(() {
                                    isHrsRemaining = !isHrsRemaining;
                                  });
                                }
                              })),
                      Expanded(
                          child: SegmentButton(
                              title: "plan details".tr,
                              isActive: !isHrsRemaining,
                              onPressed: () {
                                if (mounted) {
                                  setState(() {
                                    isHrsRemaining = !isHrsRemaining;
                                  });
                                }
                              }))
                    ],
                  ),
                ),
                if (isHrsRemaining)
                  ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getRemainingHrs().length,
                      itemBuilder: (context, index) {
                        var sObj = getRemainingHrs()[index];
                        List<RemainingHrs> stdRemHrs = getRemainingHrs();
                        return RemainingHrsRow(
                            sObj: sObj, onPressed: () {}, stdRemHrs: stdRemHrs);
                      }),
                if (!isHrsRemaining)
                  ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getStdLvlHrs().length,
                      itemBuilder: (context, index) {
                        List<StdLVlHrs> stdLvlHrs = getStdLvlHrs();
                        return LevelCompletionRow(
                          level: stdLvlHrs[index].level,
                          totalHours: stdLvlHrs[index].totalHours,
                          completedHours: stdLvlHrs[index].completedHours,
                          onPressed: () {},
                        );
                      }),
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
              'Level: $level',
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
                    style: const TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    course.status,
                    style: const TextStyle(color: Colors.black),
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
      setStdHrs();
      _studentHoursChartData = getStdHrs();
      _TooltipBehavior = TooltipBehavior(enable: true);
    } catch (e) {
      print("Error loading student plan data: $e");
    }
  }

  void setStdHrs() {
    if (studentPlan != null) {
      studentPlan!.levels.forEach((level, courses) {
        for (var course in courses) {
          String? hours = course.hours;
          String type = course.type;

          if (hours != "--" &&
              hours.isNotEmpty &&
              course.status == "Taken and Completed") {
            stdTotalHrs += int.parse(hours);
          }

          if (type == 'free' &&
              hours != "--" &&
              hours.isNotEmpty &&
              course.status == "Taken and Completed") {
            stdFreeHrs += int.parse(hours);
          } else if (type == "CSelective" &&
              hours != "--" &&
              hours.isNotEmpty &&
              course.status == "Taken and Completed") {
            stdCsElectiveHrs += int.parse(hours);
          } else if (type == "noneCSelective" &&
              hours != "--" &&
              hours.isNotEmpty &&
              course.status == "Taken and Completed") {
            stdNoneCsElectiveHrs += int.parse(hours);
          }
        }
      });
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

  List<RemainingHrs> getRemainingHrs() {
    List<RemainingHrs> stdRemHrs = [
      RemainingHrs(
          "Elective hours",
          electivesTotalHours,
          stdCsElectiveHrs + stdNoneCsElectiveHrs,
          const Color.fromARGB(255, 222, 29, 129),
          electivesTotalHours - (stdCsElectiveHrs + stdNoneCsElectiveHrs)),
      RemainingHrs("Free hours".tr, freeTotalHours, stdFreeHrs,
          const Color.fromARGB(255, 27, 188, 118), freeTotalHours - stdFreeHrs),
      RemainingHrs("Total hour".tr, totalHours, stdTotalHrs,
          const Color.fromARGB(255, 21, 163, 195), totalHours - stdTotalHrs),
    ];

    return stdRemHrs;
  }

  List<StdLVlHrs> getStdLvlHrs() {
    List<StdLVlHrs> stdLvlHrs = [];

    if (studentPlan != null) {
      studentPlan!.levels.forEach((level, courses) {
        int totalHours = 0;
        int completedHours = 0;
        String levelName = level;

        for (var course in courses) {
          if (course.hours != "--") {
            totalHours += int.parse(course.hours);
            if (course.status == "Taken and Completed") {
              completedHours += int.parse(course.hours);
            }
          }
        }

        stdLvlHrs.add(StdLVlHrs(levelName, totalHours, completedHours));
      });
    }
    return stdLvlHrs;
  }
}

class StdHours {
  StdHours(this.hrsType, this.hrs, this.color);
  String hrsType = '';
  int hrs = 0;
  Color color;
}

class StdLVlHrs {
  StdLVlHrs(this.level, this.totalHours, this.completedHours);
  final String level;
  final int totalHours;
  final int completedHours;
}

class RemainingHrs {
  RemainingHrs(
      this.type, this.total, this.takenHrs, this.color, this.remaining);
  String type;
  int total;
  int takenHrs;
  int remaining;
  Color color;
}
