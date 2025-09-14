import 'package:flutter/material.dart';


class buttons extends StatelessWidget {
  final controller;
  final String hinText;
  final bool obscureText;

  const buttons(IconData lock, {
    super.key,
    required this.controller,
    required this.hinText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(163, 158, 158, 158)),
          ),
          fillColor: const Color.fromARGB(255, 255, 249, 249),
          hintText: hinText,
          hintStyle: TextStyle(
            color: Color.fromARGB(80, 0, 0, 0),
            fontStyle: FontStyle.italic,
          ),
          filled: true,
        ),
      ),
    );
  }
}
