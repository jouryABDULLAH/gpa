// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class message_screen extends StatefulWidget {
  final List messages;
  const message_screen({super.key, required this.messages});

  @override
  State<message_screen> createState() => _message_screenState();
}

class _message_screenState extends State<message_screen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ListView.separated(
      separatorBuilder: (context, index) =>
          const Padding(padding: EdgeInsets.only(top: 10)),
      itemCount: widget.messages.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            // aligning the user's and chatbot's messages differently
            mainAxisAlignment: widget.messages[index]["isUserMessage"]
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                          widget.messages[index]["isUserMessage"] ? 20 : 0),
                      topLeft: const Radius.circular(20),
                      bottomRight: Radius.circular(
                          widget.messages[index]["isUserMessage"] ? 0 : 20),
                      topRight: const Radius.circular(20)),
                  color: widget.messages[index]["isUserMessage"]
                      ? const Color.fromARGB(255, 17, 205, 158)
                      : const Color.fromARGB(255, 255, 226, 123),
                ),
                constraints: BoxConstraints(maxWidth: width * 2 / 3),
                child: Text(
                  widget.messages[index]["message"].text.text[0],
                  style: const TextStyle(color: Colors.black38),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
