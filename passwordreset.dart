import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Passwordreset extends StatefulWidget {
   const Passwordreset({super.key});

  @override
  State<Passwordreset> createState() => _PasswordresetState();
}

class _PasswordresetState extends State<Passwordreset> {

  final Passwordcontroller=TextEditingController();
  @override
 void despose(){
  Passwordcontroller.dispose();
  super.dispose();
 }
  Future passwordreset()async{
    try{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: Passwordcontroller.text.trim());
    ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Reset code sent on this email please verify for login$Passwordcontroller')),
          
        );
           Navigator.pop(context);
  }on FirebaseAuthException {
  ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No user found with this email')),
        );
  }
  } 
  @override
  

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color.fromARGB(231, 255, 255, 255),
      appBar: AppBar(elevation: 2, backgroundColor: const Color.fromARGB(120, 255, 255, 255),),
    body:   Column(
      children: [Text('Provide the email that you used to create ',style: TextStyle(fontWeight:FontWeight.w900,fontSize: 20),),
      Text('your account ',style: TextStyle(fontWeight:FontWeight.w900,fontSize: 19)),
        Padding(
          padding: const EdgeInsets.all(80),
          child: Center(
            child: 
            
            TextField(
                controller: Passwordcontroller,
                obscureText: false,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(163, 158, 158, 158)),
                  ),
                  fillColor: const Color.fromARGB(183, 255, 249, 249),
                  hintText:'Email',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(80, 0, 0, 0),
                    fontStyle: FontStyle.italic,
                  ),
                  filled: true,
                ),
            ),
          ),
        ),
     GestureDetector(
      onTap:passwordreset ,
      child: Container(
        height: 60,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Reset',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    )],
    ),
    
    );
  }
}