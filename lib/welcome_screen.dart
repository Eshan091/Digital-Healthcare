import 'package:flutter/material.dart';

import 'package:flutter_application/login_screen.dart';
import 'package:flutter_application/navbar_roots.dart';
import 'package:flutter_application/signup_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool loading1 = false;
  bool loading2 = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                // const Color.fromARGB(255, 249, 17, 0),
                Color.fromARGB(255, 212, 11, 11),
                Colors.black,
              ],
            ),
          ),
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 45,
              ),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: TextButton(
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => NavBarRoots(),
              //           ));
              //     },
              //     child: Text(
              //       "SKIP",
              //       style: TextStyle(
              //           color: Colors.white54,
              //           fontSize: 22,
              //           fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset(
                  "images/doc.png",
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "DIGITAL HEALTHCARE",
                style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Your Health , Our Care",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    color: Color.fromARGB(255, 255, 21, 4),
                    borderRadius: BorderRadius.circular(30),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          loading2 = true;
                        });
                        Future.delayed(Duration(seconds: 1), () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                          setState(() {
                            loading2 = false;
                          });
                        });

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => LoginScreen(),
                        //     ));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        child: loading2
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Log In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ),
                  Material(
                    color: const Color.fromARGB(255, 255, 19, 2),
                    borderRadius: BorderRadius.circular(30),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          loading1 = true;
                        });
                        Future.delayed(Duration(seconds: 1), () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                          setState(() {
                            loading1 = false;
                          });
                        });
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        child: loading1
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
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
    );
  }
}
