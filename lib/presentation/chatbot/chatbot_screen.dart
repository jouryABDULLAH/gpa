// ignore_for_file: camel_case_types

import 'dart:convert';
//import 'package:flutter/services.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gpa/presentation/chatbot/message_screen.dart';
import 'package:gpa/presentation/home/home_screen.dart';
import 'package:gpa/presentation/resources/color_manager.dart';

class chatbot_screen extends StatefulWidget {
  const chatbot_screen({super.key});

  @override
  State<chatbot_screen> createState() => _chatbot_screenState();
}

class _chatbot_screenState extends State<chatbot_screen> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  @override
  // Future<void> initState() async {
  //   super.initState();
  //   String jsonString =
  //       await rootBundle.loadString('assets/dialog_flow_auth.json');
  //   print('jsonString');
  //   Map<String, dynamic> jsonMap = jsonDecode(jsonString);
  //   print('jsonMap');
  //   DialogAuthCredentials credentials = DialogAuthCredentials.fromJson(jsonMap);
  //   dialogFlowtter = DialogFlowtter(credentials: credentials);
  // }

  void initState() {
    super.initState();
    // DialogAuthCredentials credentials = DialogAuthCredentials.fromJson(
    //     'assets/dialog_flow_auth.json' as Map<String, dynamic>);
    // DialogFlowtter instance = DialogFlowtter(
    //   credentials: credentials,
    // );
    //DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    //  initializeDialogFlowtter();
  }
  /*                                                           
  Future<void> initializeDialogFlowtter() async {
    try {
      dialogFlowtter = await DialogFlowtter.fromFile();
    } catch (e) {
      print('Error initializing DialogFlowtter: $e');
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.white,
        leading: IconButton(
          onPressed: () => Get.to(const HomeScreen()),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color.fromARGB(255, 15, 89, 149),
            size: 32,
          ),
        ),
        title: const Text(
          'مرحبًا, أنا الكابتن نامق',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 15, 89, 149)),
        ),
        toolbarHeight: 90.0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: message_screen(messages: messages)),
            Container(
              color: ColorManager.blueGray,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                  )),
                  IconButton(
                      onPressed: () {
                        sendMessage(_controller.text);
                        _controller.clear();
                      },
                      icon: const Icon(Icons.send_outlined))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('message is empty');
    } else {
      setState(() {
        // user's message
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse? response;
      try {
        print('Sending message to Dialogflow...');
        response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(
            text: TextInput(text: text, languageCode: 'ar'),
          ),
        );
        print('Message sent. Response: $response');
      } catch (e) {
        print('Error sending message: $e');
      }

      // DetectIntentResponse response = await dialogFlowtter.detectIntent(
      //     queryInput: QueryInput(
      //   text: TextInput(text: text, languageCode: 'ar'),
      // ));
      // print(response);

      if (response?.message == null) {
        print('response.message is null');
        print('Response from Dialogflow: $response');
        return;
      } else {
        //chatbot response

        setState(() {
          addMessage(response!.message!);
        });
      }
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({"message": message, "isUserMessage": isUserMessage});
  }
}
// Hellos
