import 'package:flutter/material.dart';

class StatusButton extends StatelessWidget {
  final String title;
  final String value;
  final Color statusColor;

  final VoidCallback onPressed;
  const StatusButton(
      {super.key,
        required this.title,
        required this.value,
        required this.statusColor,
        required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 68,width: 85,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 74, 195, 135).withOpacity(0.15),
              ),
              color: const Color.fromARGB(255, 74, 195, 135).withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  value,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 1,
            color: statusColor,
          ),
        ],
      ),
    );
  }
}