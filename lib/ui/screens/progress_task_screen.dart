import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/task_manage_message.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          return TaskManageMessage(
            chipText: 'Progress',
            chipColor: Color(0xffA27B5C),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox();
        },
        itemCount: 10,
      ),
    );
  }
}
