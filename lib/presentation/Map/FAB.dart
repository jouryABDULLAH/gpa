import 'package:flutter/material.dart';
import 'dart:math';

final double buttonSize = 60;

class FAB extends StatefulWidget {
  const FAB({Key? key}) : super(key: key);

  @override
  State<FAB> createState() => _FABState();
}

class _FABState extends State<FAB> with SingleTickerProviderStateMixin {
  bool searchToggle = false;
  bool radiusSlider = false;
  bool cardTapped = false;
  bool pressedNear = false;
  bool getDirections = false;

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
          Icons.search,
          Icons.navigation,
          Icons.menu,
        ].map<Widget>(buildFAB).toList(),
      );

  Widget buildFAB(IconData icon) {
    void onPressedAction() {
      // Define actions for each icon
      switch (icon) {
        case Icons.search:
          setState(() {
            searchToggle = true;
            radiusSlider = false;
            pressedNear = false;
            cardTapped = false;
            getDirections = false;
          });
          print('search icon pressed');
          break;
        case Icons.navigation:
          // Action for navigation icon
          print('Navigation icon pressed');
          break;
        case Icons.menu:
          // // Animation control
          if (controller.status == AnimationStatus.completed) {
            controller.reverse();
          } else {
            controller.forward();
          }
          break;
        default:
          break;
      }
    }

    return SizedBox(
      width: buttonSize,
      height: buttonSize,
      child: FloatingActionButton(
        elevation: 0,
        splashColor: Colors.black,
        onPressed: onPressedAction,
        child: Icon(icon,
            color: const Color.fromARGB(255, 143, 54, 244), size: 45),
      ),
    );
  }
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
