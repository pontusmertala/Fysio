import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> taskContents = ['Exempel 1', 'Exempel 2', 'Exempel 3', 'Exempel 4', 'Exempel 5']; // Subtitlar för uppgifter
  final List<String> subtitles = ['Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ac arcu ex. Praesent ultricies id quam ut placerat. Ut tempus in mauris a commodo. Phasellus vehicula turpis sed velit vehicula iaculis. Curabitur lobortis lacinia massa ac consectetur. Ut tempus tortor leo, a convallis ligula aliquet vitae. Nulla vitae nulla sed odio ullamcorper tempus.',
   'Aliquam erat volutpat. Curabitur sed nisi erat. Donec quis varius elit. Aenean lacinia nulla magna, sed hendrerit velit ornare vel. Fusce eget ex ut neque fermentum aliquam eu at ipsum. Fusce fermentum auctor turpis et fermentum. Morbi hendrerit urna id elit dapibus mattis. Sed et dignissim metus. Cras nec mi nec metus placerat ultrices. Duis ut augue elit. Ut pulvinar ipsum ante, at laoreet libero posuere ac. Pellentesque ut ornare purus. Quisque id nibh lectus.',
    'Nunc quis lacus lacinia, egestas lorem vel, lacinia elit. Nunc nibh justo, varius sed vestibulum vitae, vehicula ac enim. Suspendisse potenti. Fusce luctus ante a erat fringilla tempor. Vestibulum dolor est, accumsan imperdiet orci a, cursus euismod lorem. Vivamus pulvinar dui ut fermentum vestibulum. Aenean placerat ipsum quis mi vestibulum bibendum.',
    'Vivamus a tristique ipsum. Proin diam odio, interdum ac placerat eget, blandit nec magna. Praesent molestie augue sed felis egestas, a porttitor ex viverra. Praesent pellentesque, dui non dignissim porta, lectus tortor mollis quam, eu consequat lectus nunc sed quam. Proin tincidunt mi in tortor eleifend, nec finibus tellus varius. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed tempus maximus augue vitae vehicula. Nullam non nulla aliquam, commodo odio ac, luctus sem. Nunc varius est et lectus venenatis cursus.',
    'Donec ut arcu vel metus bibendum faucibus. Nulla elementum vitae sem ut lobortis. Quisque maximus quam augue, a rhoncus magna tempor id. Integer sed odio quis nulla congue tristique. Nunc in condimentum leo, quis sollicitudin nulla. Morbi scelerisque, ex eu cursus porttitor, orci magna dignissim diam, id tempor neque sem sit amet ipsum. Pellentesque et eleifend enim, non pretium sem. Fusce porta diam mi, eu viverra nibh ullamcorper id.']; // Uppgifternas innehåll

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Övningar')),
        body: ExpansionList(
          subtitles: subtitles,
          taskContents: taskContents,
        ),
      ),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.taskContent,
    required this.taskSubtitle,
    required this.headerValue,
    this.isExpanded = false,
    this.isCompleted = false,
  });

  String taskContent;
  String taskSubtitle;
  String headerValue;
  bool isExpanded;
  bool isCompleted;
}

List<Item> generateItems(List<String> subtitles, List<String> taskContents) {
  return List<Item>.generate(subtitles.length, (int index) {
    return Item(
      headerValue: 'Övning ${index + 1}',
      taskContent: taskContents[index], // Tilldela rätt innehåll baserat på index
      taskSubtitle: subtitles[index],
    );
  });
}

class ExpansionList extends StatefulWidget {
  final List<String> subtitles;
  final List<String> taskContents;

  const ExpansionList({
    Key? key,
    required this.subtitles,
    required this.taskContents,
  }) : super(key: key);

  @override
  State<ExpansionList> createState() =>
      _ExpansionListState();
}

class _ExpansionListState extends State<ExpansionList> {
  late List<Item> _data; // Listan med uppgifter

  @override
  void initState() {
    super.initState();
    _data = generateItems(widget.subtitles, widget.taskContents); // Generera uppgifter baserat på subtitles och taskContents
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: Checkbox(
                value: item.isCompleted,
                onChanged: (bool? value) {
                  setState(() {
                    item.isCompleted = value ?? false;
                  });
                },
              ),
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.taskContent),
            subtitle: Text(item.taskSubtitle),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

void main() {
  runApp(HomePage());
}
