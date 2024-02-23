import 'package:flutter/material.dart';
import 'dart:math';

final double buttonSize = 60;

class FAB extends StatefulWidget {
  const FAB({Key? key}) : super(key: key);

  @override
  State<FAB> createState() => _FABState();
}

class _FABState extends State<FAB> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }

  void dispos() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Flow(
        delegate: FlowMinuDelegate(controller: controller),
        children: <IconData>[
          Icons.mail,
          Icons.call,
          Icons.menu,
          Icons.add,
        ].map<Widget>(buildFAB).toList(),
      );

  Widget buildFAB(IconData icon) => SizedBox(
        width: buttonSize,
        height: buttonSize,
        child: FloatingActionButton(
          elevation: 0,
          splashColor: Colors.black,
          onPressed: () {
            if (controller.status == AnimationStatus.completed) {
              controller.reverse();
            } else {
              controller.forward();
            }
          },
          child: Icon(icon, color: Colors.red, size: 45),
        ),
      );
}

class FlowMinuDelegate extends FlowDelegate {
  final Animation<double> controller;

  const FlowMinuDelegate({required this.controller})
      : super(repaint: controller);

  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final xStart = 0.0; // Left edge of the screen
    final yStart = size.height - buttonSize; // Bottom edge of the screen
    final n = context.childCount;
    for (int i = 0; i < n; i++) {
      final isLastItem = i == context.childCount - 1;
      final setValue = (value) => isLastItem ? 0.0 : value;

      final radius = 180 * controller.value;
      final theta = i * pi * 0.5 / (n - 2);
      final x = xStart + setValue(radius * cos(theta)); // Adjusted calculation
      final y = yStart - setValue(radius * sin(theta)); // Adjusted calculation
      context.paintChild(
        i,
        transform: Matrix4.identity()..translate(x, y, 0),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}
