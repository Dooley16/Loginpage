import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market/authimage.dart';
import 'package:market/passwordreset.dart';
import 'package:market/shokeeperspage.dart';
import 'package:market/signbutton.dart';
import 'buttons.dart';

class loginpag extends StatefulWidget {
  const loginpag({super.key, required this.onTap, required this.allimage});
  final Function()? onTap;
  final Function()? allimage;
  @override
  State<loginpag> createState() => _loginpagState();
}

class _loginpagState extends State<loginpag> {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

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
      Navigator.pop(context); 
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('user wasnt found ')),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Incorrect password')));
      } else {
        print('Error: ');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Please input correct email')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 234, 232, 232),
      
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
                    "welcome to Market",
                    style: TextStyle(color: Color.fromARGB(255, 117, 110, 110)),
                  ),
                  const SizedBox(height: 40),
                  buttons(
                    Icons.lock,
                    controller: usernamecontroller,
                    hinText: 'username',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  buttons(
                    Icons.lock,
                    controller: passwordcontroller,
                    hinText: 'password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        const Text('Login as a '),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => Shopkeeperspage(
                                      onTap: () {},
                                      allimage: () {},
                                    ),
                              ),
                            );
                          },
                          child: Text(
                            'Shopkeeper',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(width: 130),
                        GestureDetector(onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>Passwordreset()
                          )
                          );
                          },
                          child: Text('Forgot Password' ,style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700,),
                              ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),
                  signbutton(onTap: () => signuserin()),
                  const SizedBox(height: 10),
                  const Divider(),
                  const Text(
                    "or continue with",
                    style: TextStyle(color: Color.fromARGB(245, 158, 158, 158)),
                  ),
                  SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 254),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            'images/his.png',
                            height: 20,
                            width: 100,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 255, 254, 254),
                          ),
                          padding: EdgeInsets.all(15),
                          child: GestureDetector(
                            onTap: () => Authimage().signinwithgoogle(),
                            child: Image.asset(height: 30, 'images/apple.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.all(30)),
                      Text("Don't have account? "),

                      GestureDetector(
                        onTap: signuserin,
                        child: GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            "Register now",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
