import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:gpa/model/faculty_model.dart';
import 'package:gpa/model/rules_model.dart';
import 'package:gpa/model/question_model.dart';
import 'package:gpa/presentation/home/home_screen.dart';

class chatbotScreen extends StatefulWidget {
  const chatbotScreen({super.key});

  @override
  _chatbotScreenState createState() => _chatbotScreenState();
}

class _chatbotScreenState extends State<chatbotScreen> {
  List<Question> questions = [
    Question(
      text:
          'مرحبًا أنا نامق, هنا لمساعدتك في الإجابة على أسئلتك فيما يخص جامعة القصيم, اختر أحد الأسئلة التالية',
      isClickable: false,
      isAssistant: true,
    ),
    Question(
      text: 'الاستعلام عن أحد خدمات الجامعة أو لوائحها',
      isClickable: true,
      isAssistant: true,
      followUpQuestions: ['مالفئة التي تستهدفها هذه الخدمة؟'],
    ),
    Question(
      text: 'الاستعلام عن أحد ايميلات أعضاء هيئة التدريس',
      isClickable: true,
      isAssistant: true,
      followUpQuestions: ['العضو من أي كلية؟'],
    ),
  ];

  late List<Question> defaultQuestions;
  bool showfollowUpQuestionss = false;
  bool assistantMessage = true;
  late List<Rules> rulesList = [];
  late List<Rules> studentsRulesList = [];
  late List<Rules> facultyRulesList = [];
  late List<Rules> guestsRulesList = [];
  late List<Rules> employeesRulesList = [];
  late List<Faculty> facultyInfoList = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    defaultQuestions = List.from(questions);
    fetchRulesData();
    fetchFacultyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: const Color.fromARGB(75, 0, 0, 0),
        backgroundColor: const Color.fromARGB(255, 0, 168, 171),
        leading: IconButton(
          onPressed: () => Get.to(const HomeScreen()),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 33,
          ),
        ),
        title: Text(
          'مرحبًا, أنا الكابتن نامق',
          textAlign: TextAlign.center,
          style: GoogleFonts.tajawal(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        toolbarHeight: 120.0,
      ),
      body: Builder(builder: (context) {
        showfollowUpQuestionss = false;
        return Container(
          padding: const EdgeInsets.only(
            top: 50,
          ),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/captine.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: questions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          handleUserMessageClick(index);
                          // handleUserMessageClick2(index);
                        },
                        child: ChatBubble(
                          text: questions[index].text,
                          isAssistant: questions[index].isAssistant,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void fetchFacultyData() async {
    try {
      List<Faculty> fetchedFacultyInfo = await Faculty.fetchAll();
      if (mounted) {
        setState(() {
          facultyInfoList = fetchedFacultyInfo;
        });
      }
    } catch (e) {
      print("Error loading faculty data: $e");
    }
  }

  void fetchRulesData() async {
    try {
      List<Rules> fetchedRules = await Rules.fetchAll();
      if (mounted) {
        setState(() {
          rulesList = fetchedRules;
          studentsRulesList = rulesList
              .where((rule) => rule.service_target == 'Students')
              .toList();
          guestsRulesList = rulesList
              .where((rule) => rule.service_target == 'Guests')
              .toList();
          facultyRulesList = rulesList
              .where((rule) => rule.service_target == 'Faculty')
              .toList();
          employeesRulesList = rulesList
              .where((rule) => rule.service_target == 'Employees')
              .toList();
        });
      }
    } catch (e) {
      print("Error loading rules data: $e");
    }
  }

  void handleUserMessageClick(int index) {
    if (questions[index].text == 'العودة إلى البداية') {
      if (mounted) {
        setState(() {
          questions = [...defaultQuestions];
        });
      }
    } else if (questions[index].isClickable) {
      List<Question> nextQuestions = [];

      if (questions[index].followUpQuestions != null) {
        nextQuestions = questions[index].followUpQuestions!.map((questionText) {
          return Question(
            text: questionText,
            isClickable: true,
            isAssistant: true,
          );
        }).toList();
      } else if (questions[index].followUpQuestions == null) {
        List<String> departments = facultyInfoList
            .map((faculty) => faculty.department)
            .toSet()
            .toList();
        List<String> serviceTargets =
            rulesList.expand((rule) => rule.service_target).toSet().toList();

        if (questions[index].text == 'مالفئة التي تستهدفها هذه الخدمة؟') {
          nextQuestions = serviceTargets
              .map((target) => Question(
                    text: target,
                    isClickable: true,
                    isAssistant: true,
                  ))
              .toList();
        } else if (questions[index].text == 'العضو من أي كلية؟') {
          nextQuestions = departments
              .map((category) => Question(
                    text: category,
                    isClickable: true,
                    isAssistant: true,
                  ))
              .toList();
        } else if (serviceTargets.contains(questions[index].text)) {
          List targetRules = rulesList
              .where(
                  (rule) => rule.service_target.contains(questions[index].text))
              .toList();
          nextQuestions = targetRules
              .map((rule) => Question(
                    text: rule.title,
                    isClickable: true,
                    isAssistant: true,
                  ))
              .toList();
        } else if (departments.contains(questions[index].text)) {
          List departmentFaculty = facultyInfoList
              .where((faculty) => faculty.department == questions[index].text)
              .toList();

          nextQuestions = departmentFaculty
              .map((faculty) => Question(
                    text: faculty.name,
                    isClickable: true,
                    isAssistant: true,
                  ))
              .toList();
        } else if (rulesList
            .any((rule) => rule.title == questions[index].text)) {
          String selectedRuleTitle = questions[index].text;
          Rules selectedRule =
              rulesList.firstWhere((rule) => rule.title == selectedRuleTitle);
          String title = selectedRule.title;
          String description = selectedRule.description;
          String steps = '';
          int counter = 1;
          for (var step in selectedRule.steps) {
            steps += '$counter $step';
            steps += '\n';
            counter = counter + 1;
          }
          String url = selectedRule.url.toString();
          String answer =
              '$title,\n\n$description,\n\nالخطوات \n$steps \n..$url';
          nextQuestions = [Question(text: answer)];
        } else if (facultyInfoList
            .any((faculty) => faculty.name == questions[index].text)) {
          String selectedFacultyName = questions[index].text;
          Faculty selectedFaculty = facultyInfoList
              .firstWhere((faculty) => faculty.name == selectedFacultyName);
          String name = selectedFaculty.name.toString();
          String department = selectedFaculty.department.toString();
          String email = selectedFaculty.email.toString();
          String answer = '$name,\n\n$email ,\n\n$department';
          nextQuestions = [Question(text: answer)];
        }
      }

      if (mounted) {
        setState(() {
          questions = [
            Question(
                text: questions[index].text,
                isClickable: false,
                isAssistant: false),
            ...nextQuestions,
            Question(
                text: 'العودة إلى البداية',
                isClickable: true,
                isAssistant: true),
          ];
        });
      }
    }

    _scrollController.animateTo(
      _scrollController.position.allowImplicitScrolling as double,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isAssistant;

  const ChatBubble({
    required this.text,
    required this.isAssistant,
  });

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
        color: isAssistant
            ? const Color.fromARGB(255, 0, 168, 171)
            : const Color.fromARGB(255, 0, 81, 154),
        borderRadius: isAssistant
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                topLeft: Radius.circular(40),
                bottomRight: Radius.circular(0),
                topRight: Radius.circular(40),
              )
            : const BorderRadius.only(
                bottomLeft: Radius.circular(0),
                topLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
      ),
      // constraints: BoxConstraints(maxWidth: width * 2 / 3),
      child: Text(
        text,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        style: GoogleFonts.tajawal(
          color: Colors.white,
          fontSize: 19,
        ),
      ),
    );
  }
}
