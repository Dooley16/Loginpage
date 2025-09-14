import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market/shopregister.dart';

import 'buttons.dart';

class Shopkeepers extends StatefulWidget {
  const Shopkeepers({super.key, required this.onTap});
  final Function()? onTap;
  @override
  State<Shopkeepers> createState() => _shopkeepersState();
}

class _shopkeepersState extends State<Shopkeepers> {
  final usernamecontroller = TextEditingController();
  final confirmpasscontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  void shopkeeper() {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  void signuserin() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      if (passwordcontroller.text == confirmpasscontroller.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernamecontroller.text,
          password: passwordcontroller.text,
        );
      } else {
        showErrorMessage("password doesnt match");
      }
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.code);
      Navigator.pop(context);
    }
  }

  void showErrorMessage(String message) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: Center(
            child: Text(message, style: TextStyle(color: Colors.white)),
          ),
        );
      },
    );
  }

  void wrongemail() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('incorrect email'));
      },
    );
  }

  void wrongpassword() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('incorrect password'));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(207, 238, 236, 236),
       
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Icon(Icons.lock, size: 60),
                  const SizedBox(height: 30),
                  const Text(
                    "welcome ",
                    style: TextStyle(color: Color.fromARGB(255, 117, 110, 110)),
                  ),
                  const SizedBox(height: 30),

                  buttons(Icons.lock,
                    controller: usernamecontroller,
                    hinText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 30),
                  buttons(Icons.lock,
                    controller: passwordcontroller,
                    hinText: 'password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  buttons(Icons.lock,
                    controller: confirmpasscontroller,
                    hinText: 'confirm password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Shopregister(onTap: () {  },),
                              ),
                            );
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Text("  as a shopkeeper "),
                        Padding(padding: EdgeInsets.all(49)),
                        const Text('Forgot Password'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: signuserin,
                    child: Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Sign up',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  const Divider(),
                  const Text(
                    "or continue with",
                    style: TextStyle(color: Color.fromARGB(245, 158, 158, 158)),
                  ),
                  SizedBox(height: 20),

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
                      SizedBox(width: 20),
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
                          child: Image.asset(height: 30, 'images/apple.png'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.all(30)),
                      Text("already have account? "),
                      GestureDetector(
                        onTap: signuserin,
                        child: GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            "Login",
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
