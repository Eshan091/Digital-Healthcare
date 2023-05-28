import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Clinicvisit_screen.dart';
import 'package:flutter_application/DoctorFour_screen.dart';
import 'package:flutter_application/DoctorOne_screen.dart';
import 'package:flutter_application/DoctorThree_screen.dart';
import 'package:flutter_application/DoctorTwo_screen.dart';
import 'package:flutter_application/Homevisit_screen.dart';
import 'package:flutter_application/appointment.dart';
import 'package:flutter_application/blood_screen.dart';
import 'package:flutter_application/login_screen.dart';
import 'package:flutter_application/profile_screen.dart';
import 'package:flutter_application/signup_screen.dart';
import 'package:flutter_application/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  List symptoms = [
    "Ambulance",
    "Diagnostic Centre",
    "Dentist",
    "Orthologist",
    "Nearby Hospital",
    "Need Blood?",
    "Nearby Bloodbanks",
    "Hospitals having Ventilator"
  ];
  List doctorname = [
    "Dr. A K Agarwal",
    "Dr Jai Prakash Jaiswal ",
    "DR. KETAN AGARWAL",
    "DR. P N JAISWAL",
  ];

  List imgs = ["agarwal.png", "jai.png", "ketan.png", "pnjaiswal.png"];
  final User = FirebaseAuth.instance.currentUser!;

  final Uri urlA = Uri.parse(
      "https://www.google.com/maps/search/nearest+ambulance+service/@26.7958131,83.3896118,15z/data=!3m1!4b1?entry=ttu");
  final Uri urlDentist = Uri.parse(
      "https://www.google.com/maps/search/dental+clinic+in+gkp/@26.7958131,83.3896118,15z/data=!3m1!4b1?entry=ttu");

  final Uri urlDia = Uri.parse(
      "https://www.google.com/maps/search/diaognisis+center+in+gkp/@26.7958131,83.3896118,15z/data=!3m1!4b1?entry=ttu");
  final Uri urlOrtho = Uri.parse(
      "https://www.google.com/maps/search/orthologist+hospital+near+me/@26.7958131,83.3896118,15z/data=!3m1!4b1?entry=ttu");
  final Uri urlBest = Uri.parse(
      "https://www.google.com/maps/search/hospital+near+me/@26.7958131,83.3896118,15z/data=!3m1!4b1?entry=ttu");

  final Uri urlBlood = Uri.parse(
      "https://www.google.com/maps/search/nearby+blood+banks/@26.8506061,80.9557559,13z/data=!3m1!4b1?entry=ttu");
  final Uri urlventilator = Uri.parse(
      "https://www.google.com/maps/search/hospitals+having+ventilator+in+gorakhpur/@26.7723148,83.343382,13z/data=!3m1!4b1?entry=ttu");
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Text(
                  'Alert',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                content: Text(
                  'Do you want to exit?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('No'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()));
                    },
                    child: Text('exit'),
                  ),
                ],
              );
            });
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: new Scaffold(
        body: Container(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hello  " +
                            User.email!
                                .substring(0, User.email!.indexOf('@'))
                                .toUpperCase(),
                        style: GoogleFonts.kanit(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      // CircleAvatar(
                      //   radius: 15,
                      //   backgroundImage: AssetImage("images/doctor1.jpeg"),
                      // )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClinicVisit(),
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomLeft,
                            colors: [
                              // const Color.fromARGB(255, 249, 17, 0),

                              Color.fromARGB(221, 238, 221, 221),
                              Colors.white,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.red.shade400,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Clinic Visit",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Make an Appointment",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeVisit(),
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.home,
                                color: Colors.red,
                                size: 15,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Home Visit",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Call the doctor home",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "What are you looking for?",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: 1),
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: symptoms.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (index == 0) {
                            // showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return Center(
                            //           child: CircularProgressIndicator());
                            //     });

                            launchUrl(urlA);
                          }
                          if (index == 1) {
                            launchUrl(urlDia);
                          }
                          if (index == 2) {
                            launchUrl(urlDentist);
                          }
                          if (index == 3) {
                            launchUrl(urlOrtho);
                          }
                          if (index == 4) {
                            launchUrl(urlBest);
                          }
                          if (index == 5) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BloodScreen(),
                                ));
                          }
                          if (index == 6) {
                            launchUrl(urlBlood);
                          }
                          if (index == 7) {
                            launchUrl(urlventilator);
                          }
                          // Navigator.of(context).pop();
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomLeft,
                              colors: [
                                // const Color.fromARGB(255, 249, 17, 0),

                                Color.fromARGB(221, 238, 221, 221),
                                Colors.white,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 4,
                                spreadRadius: 2,
                              )
                            ],
                          ),
                          child: Center(
                              child: Text(symptoms[index],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87))),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "Popular Doctors",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1),
                  ),
                ),
                GridView.builder(
                  padding: EdgeInsets.only(bottom: 5),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorOne(),
                              ));
                        }
                        if (index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorTwo(),
                              ));
                        }
                        if (index == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorThree(),
                              ));
                        }
                        if (index == 3) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorFour(),
                              ));
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomLeft,
                            colors: [
                              // const Color.fromARGB(255, 249, 17, 0),

                              Color.fromARGB(221, 238, 221, 221),
                              Colors.white,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87,
                              blurRadius: 4,
                              spreadRadius: 2,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(
                                "images/${imgs[index]}",
                              ),
                            ),
                            Text(
                              doctorname[index],
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),

                            // Text(
                            //   "Dr. Eshan Srivastava",
                            //   style: TextStyle(
                            //       fontSize: 18,
                            //       fontWeight: FontWeight.bold,
                            //       color: Colors.black),
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(
                                  "4.9",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
