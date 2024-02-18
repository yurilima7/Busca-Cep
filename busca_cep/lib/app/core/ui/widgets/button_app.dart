import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;

  const ButtonApp({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
