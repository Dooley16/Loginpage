import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:market/chatpage.dart';
import 'package:market/market.dart';
import 'package:market/profilepage.dart';

class marketplace extends StatefulWidget {
  
  const marketplace({super.key});


  @override
  State<marketplace> createState() => _marketplaceState();
}
int selectedpage=0;
class _marketplaceState extends State<marketplace> {
  void Function(int)? onTabChange;
  int selectedpage=0;
  static const TextStyle optionalStyle=TextStyle(fontSize: 20,fontWeight:FontWeight.w600 );
  static const List<Widget> Widgetoptions =<Widget>[ 
    Text( "Home",style: optionalStyle),
    Text( "Profile",style: optionalStyle),
    Text( "Chat",style: optionalStyle)]; 
  
void switchpages(int index){
  setState(() { 
    selectedpage=index;
  
  });

}
  void signuserout() {
    FirebaseAuth.instance.signOut();
  }

void navigationbar(int index){
setState(() {
  
});
  
}
void creen(){
     Navigator.pop(context);
}
final List<Widget>pages=[
  
Market(),
const Profilepage(uid: '',),

chatpage(),


];

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
     
        bottomNavigationBar: 
        
         GNav(
          color: const Color.fromARGB(179, 147, 143, 143),
          activeColor: Colors.grey.shade700,
          tabActiveBorder: Border.all(color: const Color.fromARGB(204, 205, 201, 201)),
          tabBackgroundColor:const Color.fromARGB(224, 245, 245, 245) ,
      mainAxisAlignment: MainAxisAlignment.center,
     
         tabs: const [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.person_2_rounded, text: 'Profile'),
            GButton(icon:LineIcons.facebookMessenger, text: 'Chats'),
          ],
          
          onTabChange:(index)=> switchpages(index)
            
       ),
       body:  pages[selectedpage] ,
     
       );

  }
}
