import 'package:flutter/material.dart';
import 'package:sushi_ui/constants/fonts.dart';

void nextScreen(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

//show dialog
void showMessage(BuildContext context, String texts) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.teal[700],
          title: Text(
            texts,
            style: fontsButton,
          ),
          icon: const Icon(
            Icons.check,
            size: 30,
            color: Colors.white,
          ),
        );
      },
    );
  });
}
