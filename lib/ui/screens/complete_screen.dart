import 'package:flutter/material.dart';
import '../widgets/task_manage_message.dart';

class CompleteScreen extends StatefulWidget {
  const CompleteScreen({super.key});

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          return TaskManageMessage(
            chipText: 'Complete',
            chipColor: Color(0xff1F7D53),
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
