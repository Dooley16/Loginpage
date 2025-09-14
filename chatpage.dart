import 'package:flutter/material.dart';
import 'package:market/stars.dart';

class chatpage extends StatefulWidget {
  const chatpage({super.key});

  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Stars());
  }
}