import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_screen.dart';
import '../widgets/status_board.dart';
import '../widgets/task_manage_message.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Row(
                  children: [
                    StatusBoard(
                      taskNum: '08',
                      taskSubText: 'Cancelled',
                      taskNumColor: Color(0xffBF3131),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    StatusBoard(
                      taskNum: '06',
                      taskSubText: 'Completed',
                      taskNumColor: Color(0xff1F7D53),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    StatusBoard(
                      taskNum: '10',
                      taskSubText: 'Progress',
                      taskNumColor: Color(0xffA27B5C),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    StatusBoard(
                      taskNum: '05',
                      taskSubText: 'New Task',
                      taskNumColor: Color(0xffE07A5F),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                itemBuilder: (context, index) {
                  return TaskManageMessage(
                    chipText: 'New',
                    chipColor: Color(0xffE07A5F),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                      // height: 10,
                      );
                },
                itemCount: 10,
                primary: false,
                shrinkWrap: true,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void>_getAllNewTask() async{

}
}
