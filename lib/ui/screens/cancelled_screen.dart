import 'package:flutter/material.dart';

import '../widgets/task_manage_message.dart';

class CancelledScreen extends StatefulWidget {
  const CancelledScreen({super.key});

  @override
  State<CancelledScreen> createState() => _CancelledScreenState();
}

class _CancelledScreenState extends State<CancelledScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          return TaskManageMessage(
            chipText: 'Cancel',
            chipColor: Color(0xffBF3131),
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
