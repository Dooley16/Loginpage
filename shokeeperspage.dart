import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market/shopregister.dart';
import 'package:market/signbutton.dart';
import 'buttons.dart';

class Shopkeeperspage extends StatefulWidget {
  const Shopkeeperspage({super.key, required this.onTap, required this.allimage});
  final Function()? onTap;
  final Function()? allimage;
  @override
  State<Shopkeeperspage> createState() => _shopkeeperspageState();
}

class _shopkeeperspageState extends State<Shopkeeperspage> {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final phonecontroller=TextEditingController();
   final String _verificationid = '';

  void signuserin() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernamecontroller.text,
        password: passwordcontroller.text,
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(
          context,
        );
      }  else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(
          context,
        );
      }ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$e')),
          
        );
      
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationid,
        smsCode: phonecontroller.text,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      print('h');
      
      
      Navigator.pop(context);
    }catch (e) {
       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Reset code sent on this email$e')));
    }

  } 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(appBar: AppBar(backgroundColor: const Color.fromARGB(0, 255, 255, 255),),
        backgroundColor: const Color.fromARGB(231, 253, 248, 248),
       
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Icon(Icons.lock, size: 60),
                  const SizedBox(height: 50),
                  const Text(
                    "welcome Shopkeeper",
                    style: TextStyle(color: Color.fromARGB(255, 117, 110, 110)),
                  ),
                  const SizedBox(height: 40),
                  buttons(Icons.lock,
                    controller: usernamecontroller,
                    hinText: 'Shop name',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  buttons(Icons.lock,
                    controller: passwordcontroller,hinText:'shop password',
                    obscureText: true,
                  ),
                  SizedBox(height: 20,),
                   buttons(Icons.lock,
                    controller: phonecontroller,hinText:'Phone number',
                    obscureText: true,
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 300),
                    child: Text('Forgot password'),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),

                  const SizedBox(height: 20),
                  signbutton(onTap: () => signuserin()),
                  const SizedBox(height: 10),
                  const Divider(),
                
                  SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     
                  SizedBox(height: 70),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.all(30)),
                      Text("Don't have Shop? "),

                    
                       GestureDetector(
                          onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>Shopregister(onTap: (){})
                          )
                          );
                          },
                          child: Text(
                            "Register now",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      
                    ],
                  ),
                ],
              ),
              ])
          ),
        ),
      ),
     ) );
  }
}
