import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/model/rules_model.dart';
import 'package:gpa/model/question_model.dart';
import 'package:gpa/presentation/chatbot/chatbot_welcome_screen.dart';
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
  List<Rules> rulesList = [];
  final ScrollController _scrollController = ScrollController();
  // late Future<List<Rules>> futureRules;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // futureRules = fetchRulesData();
    defaultQuestions = List.from(questions);
    fetchRulesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Color.fromARGB(75, 0, 0, 0),
        backgroundColor: Color.fromARGB(255, 0, 168, 171),
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
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        toolbarHeight: 120.0,
      ),
      body: Builder(builder: (context) {
        showfollowUpQuestionss = false;
        return Container(
          padding: const EdgeInsets.only(top: 50),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
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

  void fetchRulesData() async {
    List<Rules> fetchedRules = await Rules.fetchAll();
    // return fetchedRules;
    setState(() {
      rulesList = fetchedRules;
    });
  }

  void handleUserMessageClick(int index) {
    if (questions[index].text == 'العودة إلى البداية') {
      setState(() {
        questions = [...defaultQuestions];
      });
    } else if (questions[index].isClickable) {
      // default value is the followup question | we can use late instead
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
        // in case the follow-up question is empty assign it
        if (questions[index].text == 'مالفئة التي تستهدفها هذه الخدمة؟') {
          // List<String> categories =
          //     rulesList.map((rule) => rule.service_target).toSet().toList();

          List<Rules> rules = rulesList;
          Set<String> uniqueCategories = {};
          for (Rules rule in rules) {
            uniqueCategories.add(rule.service_target);
          }
          nextQuestions = uniqueCategories
              .map((category) => Question(
                    text: category,
                    isClickable: true,
                    isAssistant: true,
                  ))
              .toList();
        } else if (questions[index].text == 'العضو من أي كلية؟') {
          List<String> departments = ['CS', 'IT', 'CE'];

          nextQuestions = departments
              .map((category) => Question(
                    text: category,
                    isClickable: true,
                    isAssistant: true,
                  ))
              .toList();
        }
      }
      setState(() {
        // List<Question> nextQuestions =
        //     questions[index].followUpQuestions!.map((questionText) {
        //   return Question(
        //     text: questionText,
        //     isClickable: true,
        //     isAssistant: true,
        //   );
        // }).toList();
        questions = [
          ...questions.sublist(0, index),
          Question(
              text: questions[index].text,
              isClickable: false,
              isAssistant: false),
          ...nextQuestions,
          Question(
              text: 'العودة إلى البداية', isClickable: true, isAssistant: true),
        ];
      });
    }

    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  // void handleUserMessageClick(int index) {
  //   if (questions[index].isClickable) {
  //     print(
  //         '\n\n\n-------------------------------\n\t\t$rulesList\n----------------------------------------------------\n\n\n\n');
  //     if (questions[index].text == 'العودة إلى البداية') {
  //       setState(() {
  //         questions = [...defaultQuestions];
  //       });
  //     } else if (questions[index].followUpQuestions != null) {
  //       //List<String> newFollowUpQuestions = [];
  //       List<String> nextQuestions = [];
  //       //questions[index].followUpQuestions;
  //       if (questions[index].followUpQuestions ==
  //           ['مالفئة التي تستهدفها هذه الخدمة؟']) {
  //         nextQuestions =
  //             rulesList.map((rule) => rule.service_target).toSet().toList();
  //       } else if (questions[index].followUpQuestions ==
  //           ['العضو من أي كلية؟']) {
  //         nextQuestions = ['CS', 'IT', 'CE'];
  //       }
  //       setState(() {
  //         List<Question> nextQuestions = // show the follow up question a the next question
  //             questions[index].followUpQuestions!.map((questionText) {
  //           return Question(
  //             text: questionText,
  //             isClickable: true,
  //             isAssistant: true,
  //           );
  //         }).toList();
  //         questions = [
  //           Question(
  //               text: questions[index].text,
  //               isClickable: false,
  //               isAssistant: false),
  //           ...nextQuestions.map((category) => Question(
  //                 text: nextQuestions.toString(),
  //                 isClickable: true,
  //                 isAssistant: true,
  //               )),
  //           //  .toList(),
  //           Question(
  //             text: 'العودة إلى البداية',
  //             isClickable: true,
  //             isAssistant: true,
  //           ),
  //         ];
  //       });
  //     }
  //   }

  //   _scrollController.animateTo(
  //     _scrollController.position.maxScrollExtent,
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.easeOut,
  //   );
  // }
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
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
        color: isAssistant
            ? Color.fromARGB(255, 0, 168, 171)
            : Color.fromARGB(255, 0, 81, 154),
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
      constraints: BoxConstraints(maxWidth: width * 2 / 3),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: GoogleFonts.tajawal(
          color: Colors.white,
          fontSize: 19,
        ),
      ),
    );
  }
}
