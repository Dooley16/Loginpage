import 'package:flutter/material.dart';

class Bio extends StatelessWidget {

   final String text;
     const Bio({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: Colors.grey
      ),
     child:  Text(text.isNotEmpty ? text:"Empty bio...")
    );
  } 
}