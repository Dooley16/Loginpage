import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:market/marketpage.dart';
import 'package:market/registerpage.dart';

class aut extends StatelessWidget {
  const aut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream :FirebaseAuth.instance.authStateChanges()
      ,builder: (context, snapshot) {
        if (snapshot.hasData){  
          return marketplace();

        }
      
        else {return Registerpage();}
      } ),);
  }
}