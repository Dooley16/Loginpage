import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Profilepage extends StatefulWidget {
  final String uid;
  const Profilepage({super.key,required this.uid});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}
void signuserout() {
    FirebaseAuth.instance.signOut();
  }
class _ProfilepageState extends State<Profilepage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      appBar: AppBar(title: Text("Logout",textAlign:TextAlign.center,),
        actions: [IconButton(onPressed: signuserout, icon: Icon(Icons.logout)
        )],
      ), 
      body: Center(child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 230, 230, 230),
borderRadius: BorderRadius.circular(40)
            ),
            height: 120,
            padding: EdgeInsets.all(26),
            width: 120,
            
            child: Center(
              child: Icon(Icons.person,
              size: 72,color: Colors.grey,),
            ),
          ),
     
      ]))
    );
  }
}