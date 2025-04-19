import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message,
    [bool isError = false]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: isError ? Colors.redAccent : Colors.greenAccent,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          // color: isError ? Colors.redAccent : Colors.greenAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
