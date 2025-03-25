import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'bottom_part_message_card.dart';

class TaskManageMessage extends StatelessWidget {
  final String chipText;
  final Color chipColor;
  const TaskManageMessage(
      {super.key, required this.chipText, required this.chipColor});

  @override
  Widget build(BuildContext context) {
    DateTime myDate = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(myDate);
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffF1F0E9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lorem Ipsum is simply dummy',
            style: TextStyle(
              color: Color(0xff481E14),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'A task management task involves organizing, tracking, and prioritizing activities to ensure efficient completion of work.',
            style: TextStyle(
              color: Color(0xff413F42),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Date: $formattedDate',
            style: TextStyle(
              color: Color(
                0xff206A5D,
              ),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MessageTagAndButton(
            chipText: chipText,
            chipColor: chipColor,
          )
        ],
      ),
    );
  }
}
