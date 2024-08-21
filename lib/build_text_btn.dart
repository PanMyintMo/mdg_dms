import 'package:flutter/material.dart';

Widget buildButton(String text, VoidCallback confirm) {
  return ElevatedButton(
    onPressed: confirm,
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.grey,
      minimumSize: const Size(30, 40),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      side: BorderSide(color: Colors.grey.withOpacity(0.5)),
      elevation: 0,
    ),
    child: Text(
      text,
      style: TextStyle(color: Colors.grey[600]),
    ),
  );
}
