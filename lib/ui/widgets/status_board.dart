import 'package:flutter/material.dart';

class StatusBoard extends StatelessWidget {
  final String taskNum;
  final String taskSubText;
  final Color taskNumColor;
  const StatusBoard(
      {super.key,
        required this.taskNum,
        required this.taskSubText,
        required this.taskNumColor});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double spacing = 10.0;
    TextTheme text = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xffF1F0E9),
      ),
      // padding: EdgeInsets.all(10),
      width: (screenWidth - (spacing * 5)) / 4,
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            taskNum,
            style: text.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: taskNumColor,
            ),
          ),
          Text(
            taskSubText,
            style: text.bodyLarge?.copyWith(
              color: taskNumColor,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}