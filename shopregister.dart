
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:market/shokeeperspage.dart';
import 'buttons.dart';


class Shopregister extends StatefulWidget {
  const Shopregister({super.key, required this.onTap});
  final Function()? onTap;

  @override
  State<Shopregister> createState() => _ShopregisterState();
}

class _ShopregisterState extends State<Shopregister> {
  final usernamecontroller = TextEditingController();

  final TextEditingController confirmpasscontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController otpcontroller = TextEditingController();
  String verificationum = '';
  bool isotpsent = false;

  loginwithemailandpassword() async {
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

  Future<void> verifyphonenumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phonecontroller.text,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (error) {
        print('error');
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          verificationum = verificationId;
          isotpsent = true;
        });
        print('code sent to $phonecontroller');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          verificationum = verificationId;
        });
      },
    );
  }

  Future<void> signwithphonenumber() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationum,
        smsCode: otpcontroller.text,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      print('h');
    } catch (e) {
       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Reset code sent on this email$e')));
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(238, 255, 254, 254),
   
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Icon(Icons.shop_sharp, size: 60),
                  const SizedBox(height: 30),
                  const Text(
                    "Register for a shop",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  const SizedBox(height: 30),

                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(163, 158, 158, 158),
                        ),
                      ),
                      fillColor: const Color.fromARGB(255, 255, 249, 249),
                      hintText: 'Shop name',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(80, 0, 0, 0),
                        fontStyle: FontStyle.italic,
                      ),
                      filled: true,
                    ),
                    controller: usernamecontroller,
                  ),

                  const SizedBox(height: 30),
                  buttons(
                    Icons.lock,
                    controller: passwordcontroller,
                    hinText: 'Shop password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(163, 158, 158, 158),
                        ),
                      ),
                      fillColor: const Color.fromARGB(255, 255, 249, 249),
                      hintText: 'confirm password',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(80, 0, 0, 0),
                        fontStyle: FontStyle.italic,
                      ),
                      filled: true,
                    ),

                    controller: confirmpasscontroller,
                  ),

                  SizedBox(height: 20),
                  TextField(
                    obscureText: false,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(163, 158, 158, 158)),
          ),
          fillColor: const Color.fromARGB(255, 255, 249, 249),
          hintText: 'phone number',
          hintStyle: TextStyle(
            color: Color.fromARGB(80, 0, 0, 0),
            fontStyle: FontStyle.italic,
          ),
          filled: true,
        ),
                      controller: otpcontroller,
              
                    ),
            
                  Row(
                    children: [
                      Container(
                        child: GestureDetector(
                          onTap: () async {
                            await loginwithemailandpassword();
                            await verifyphonenumber();
                          },
                          child: Container(
                            height: 60,
                            width: 140,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Send',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
if(isotpsent)...[
  TextField(controller: otpcontroller,
  decoration: InputDecoration(label: Text('Enter OTP'),
  ),
  ),ElevatedButton(onPressed: signwithphonenumber, child: Text('Very OTP'))
],
                  const SizedBox(height: 10),

                  
                  

                  const SizedBox(height: 10),

                  GestureDetector(
                    onTap: () async {
                            await loginwithemailandpassword();
                            await verifyphonenumber();},
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

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [SizedBox(width: 20)],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.all(30)),
                      Text("already have account? "),

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
                          "Login",
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
            ),
          ),
        ),
      ),
    );
  }
}
