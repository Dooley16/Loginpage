import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';


class Navbar extends StatefulWidget {
  void Function(int)? onTabChange;

  Navbar({super.key,required this.onTabChange});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {

int selectedpage=0;
  static const TextStyle optionalStyle=TextStyle(fontSize: 20,fontWeight:FontWeight.w600 );
  static const List<Widget> Widgetoptions =<Widget>[ 
    Text( "Home",style: optionalStyle),
    Text( "Profile",style: optionalStyle),
    Text( "Chat",style: optionalStyle)];
  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.symmetric(vertical: 20),
      child: Scaffold(
        
        bottomNavigationBar: 
         GNav(
          color: Colors.grey[400],
          activeColor: Colors.grey.shade700,
          tabActiveBorder: Border.all(color: Colors.white),
          tabBackgroundColor:Colors.grey.shade100 ,
      mainAxisAlignment: MainAxisAlignment.center,
     
         tabs: const [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.person_2_rounded, text: 'Profile'),
            GButton(icon:LineIcons.facebookMessenger, text: 'Chats'),
          ],
          selectedIndex: selectedpage ,
          onTabChange: (index){
            setState(() {
              selectedpage=index;
            });
          }, 
       ))

        );
          
         
          }
      
  
  }

