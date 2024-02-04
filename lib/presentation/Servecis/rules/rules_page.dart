import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa/presentation/home/home_screen.dart';
import 'package:gpa/presentation/resources/color_manager.dart';

class rulesPage extends StatefulWidget {
  const rulesPage({super.key});

  @override
  State<rulesPage> createState() => _rulesPageState();
}

class _rulesPageState extends State<rulesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.primary,
        leading: IconButton(
          onPressed: () => Get.to(HomeScreen()),
          icon: Icon(
            Icons.home,
            color: Colors.black,
            size: 32,
          ),
        ),
        title: Text(
          'خدمات وقوانين الجامعة',
          textAlign: TextAlign.center, // Align the text in the center
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.black, size: 25),
          ),
        ],
        toolbarHeight: 90.0,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(30, 50, 30, 10),
            child: Column(children: [
              const Text(' خدمات الجامعة'),
              const Text('الخدمات المعروضة هي خدمات مقررة من الجامعة')
            ]),
          ),
          Container(
            height: 550,
            child: RulesList(),
            margin: EdgeInsets.fromLTRB(20, 5, 20, 30),
          )
        ],
      ),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'خدمة $index',
      expandedValue: 'هذه الخدمة رقم  $index',
    );
  });
}

class RulesList extends StatefulWidget {
  const RulesList({super.key});

  @override
  State<RulesList> createState() => _RulesListState();
}

class _RulesListState extends State<RulesList> {
  final List<Item> _data = generateItems(5);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15),
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expandedHeaderPadding: const EdgeInsets.all(2),
      animationDuration: const Duration(seconds: 1),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: ColorManager.card,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 1, // Adjust the height of the divider
                color: const Color.fromARGB(
                    255, 9, 55, 92), // Customize the color of the divider
              ),
              ListTile(
                  hoverColor: ColorManager.blue,
                  title: Text(item.expandedValue),
                  // هنا شرح الخدمة
                  subtitle: const Text(
                      'هنا نجد تفاصيل الخدمة وتوضيحها وماهيتها الخ الخ الخ الخ الخ الخ ...'),
                  trailing: const Column(
                    children: [
                      Icon(Icons.video_camera_back),
                      Text('شرح الخدمة')
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      // show the video on youtube
                      _data.removeWhere(
                          (Item currentItem) => item == currentItem);
                    });
                  }),
            ],
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
