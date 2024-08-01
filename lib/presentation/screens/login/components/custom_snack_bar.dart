import 'package:flutter/material.dart';

SnackBar customSnackBar({required String message, required context}) {
  return SnackBar(
    content: SizedBox(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            message,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFFF1F0F4)),
          )),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: const Icon(Icons.close, color: Color(0xFFF1F0F4)),
          ),
        ],
      ),
    ),
    backgroundColor: const Color(0xFFF1F0F4),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
    duration: const Duration(hours: 1),
  );
}
