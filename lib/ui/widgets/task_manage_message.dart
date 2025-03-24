import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskManageMessage extends StatelessWidget {
  const TaskManageMessage({super.key});


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
            'A task management task involves organizing, tracking, and prioritizing activities to ensure efficient completion of work.',style: TextStyle(color: Color(0xff413F42),),),
          SizedBox(height: 5,),
          Text('Date: $formattedDate',style: TextStyle(color:Color(0xff206A5D,),fontWeight: FontWeight.bold,),),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Aligns the children to the start
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 6.0), // Adds padding to the text
                decoration: BoxDecoration(
                  color: Colors.greenAccent, // Tag color
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners for the tag
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 1), // Shadow effect
                    ),
                  ],
                ),
                child: Text(
                  'New',
                  style: TextStyle(
                    fontSize: 16, // Font size for the text
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color
                  ),
                ),
              ),


              SizedBox(
                  width:
                  16), // Adds some space between the button and icons
              Row(
                children: [
                  Icon(
                    Icons.newspaper_rounded,
                    size: 30,
                    color: Colors.greenAccent,
                  ),
                  SizedBox(
                      width:
                      8), // Adds some space between icons if needed
                  Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}