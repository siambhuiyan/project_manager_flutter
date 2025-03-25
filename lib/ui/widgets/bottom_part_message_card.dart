import 'package:flutter/material.dart';

class MessageTagAndButton extends StatelessWidget {
  final String chipText;
  final Color chipColor;
  // final IconData icon1;
  // final IconData icon2;
  const MessageTagAndButton({
    super.key,
    required this.chipText,
    required this.chipColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween, // Aligns the children to the start
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              horizontal: 30.0, vertical: 6.0), // Adds padding to the text
          decoration: BoxDecoration(
            color: chipColor, // Tag color
            borderRadius:
                BorderRadius.circular(12.0), // Rounded corners for the tag
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
            chipText,
            style: TextStyle(
              fontSize: 16, // Font size for the text
              fontWeight: FontWeight.bold,
              color: Colors.white, // Text color
            ),
          ),
        ),

        SizedBox(width: 16), // Adds some space between the button and icons
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.newspaper_rounded,
                size: 30,
              ),
              color: Colors.greenAccent,
              onPressed: () {},
            ),
            SizedBox(width: 8), // Adds some space between icons if needed
            IconButton(
              icon: Icon(
                Icons.delete,
                size: 30,
              ),
              color: Colors.redAccent,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
