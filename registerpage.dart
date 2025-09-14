import 'package:flutter/material.dart';
import 'package:market/loginpage.dart';
import 'package:market/registeredpage.dart';

class  Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  bool showloginpage= true;
 
  
  void switchpages(){
setState(() {
  showloginpage=!showloginpage;

});
  }
@override
  Widget build(BuildContext context) {
    if(showloginpage){
    return loginpag(
      onTap:switchpages, allimage: () {  } ,
    ) ; 
    } else {return Registeredpage(onTap: switchpages,);}
   
  }}
  