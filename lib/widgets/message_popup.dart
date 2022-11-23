import 'package:flutter/material.dart';

class CustomSnackAlert {
  static SnackBar showSnackBar(String message) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1500),
      margin: const EdgeInsets.only(
        bottom: 250,
        left: 30,
        right: 30
      ),
      content: Container(
        constraints: const BoxConstraints(
          minHeight: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
          ]
        )
      )
    );
  }
}
