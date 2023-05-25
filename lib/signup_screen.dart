import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/utils/utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool passToggle = true;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _fcontroller = TextEditingController();
  TextEditingController _pcontroller = TextEditingController();
  TextEditingController _econtroller = TextEditingController();

  TextEditingController _phcontroller = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  Color _inputTextColor = Colors.white;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _fcontroller.dispose();
    _pcontroller.dispose();
    _phcontroller.dispose();
    _econtroller.dispose();
  }

  void signUp() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });

      _auth
          .createUserWithEmailAndPassword(
              email: _econtroller.text.toString(),
              password: _pcontroller.text.toString())
          .then((value) {
        Utils().loginToastMessage(
          "account created successfully,please login",
        );
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));

        //adding user details
        addUserdetails(
            _fcontroller.text.toString(),
            _econtroller.text.toString(),
            int.parse(_phcontroller.text.toString()));

        setState(() {
          loading = false;
        });
      }).onError((error, stackTrace) {
        Utils().toastMessage(error.toString());
        setState(() {
          loading = false;
        });
      });
    }
  }

  Future addUserdetails(String fullName, String email, int phone) async {
    await FirebaseFirestore.instance.collection('users').add({
      'full name': fullName,
      'email ': email,
      'phone no': phone,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              // const Color.fromARGB(255, 249, 17, 0),

              Color.fromARGB(255, 254, 10, 10),
              Color.fromARGB(255, 33, 5, 37),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Image.asset(
                    "images/doctor.png",
                  ),
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextFormField(
                          controller: _fcontroller,
                          style: TextStyle(color: _inputTextColor),
                          decoration: InputDecoration(
                            label: Text(
                              "Full name",
                              style: TextStyle(color: Colors.white),
                            ),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-z]+$').hasMatch(value!)) {
                              return "please enter correct name ";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextFormField(
                          controller: _econtroller,
                          style: TextStyle(color: _inputTextColor),
                          decoration: InputDecoration(
                            label: Text(
                              "Email Address",
                              style: TextStyle(color: Colors.white),
                            ),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[\w.+\-]+@gmail\.com$')
                                    .hasMatch(value)) {
                              return 'Enter valid email';
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextFormField(
                          controller: _phcontroller,
                          style: TextStyle(color: _inputTextColor),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text(
                              "Phone Number",
                              style: TextStyle(color: Colors.white),
                            ),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^(\+91[\-\s]?)?[0]?(91)?[6789]\d{9}$')
                                    .hasMatch(value!)) {
                              return "please enter correct phone no. ";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextFormField(
                          controller: _pcontroller,
                          style: TextStyle(color: _inputTextColor),
                          obscureText: passToggle ? true : false,
                          decoration: InputDecoration(
                            label: Text(
                              "Password",
                              style: TextStyle(color: Colors.white),
                            ),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                if (passToggle == true) {
                                  passToggle = false;
                                } else {
                                  passToggle = true;
                                }
                                setState(() {});
                              },
                              child: passToggle
                                  ? Icon(
                                      CupertinoIcons.eye_slash_fill,
                                      color: Colors.white,
                                    )
                                  : Icon(
                                      CupertinoIcons.eye_fill,
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter  password';
                            } else if (value.length < 6) {
                              return "Atleast 6 characters required ";
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 13),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: Material(
                      color: Color.fromARGB(255, 20, 219, 27),
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          signUp();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          child: Center(
                            child: loading
                                ? CircularProgressIndicator(
                                    strokeWidth: 3,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Create Account",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have account?",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                          fontStyle: FontStyle.italic),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
