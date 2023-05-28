import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/session.dart';
import 'package:flutter_application/welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User = FirebaseAuth.instance.currentUser!;
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
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
          child: Column(
            children: [
              SizedBox(
                height: 220,
                child: Center(
                  child: CircleAvatar(
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.black,
                    maxRadius: 60,

                    // Icons.person,
                    // size: 100,
                    // color: Colors.white,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(50)),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      User.email!
                          .substring(0, User.email!.indexOf('@'))
                          .toUpperCase(),
                    ),
                  ),
                  leading: Icon(
                    Icons.person,
                    size: 30,
                  ),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(50)),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(User.email!),
                  ),
                  leading: Icon(
                    Icons.email_rounded,
                    size: 30,
                  ),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(50)),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Gorakhpur"),
                  ),
                  leading: Icon(
                    Icons.location_history,
                    size: 30,
                  ),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 24, 9),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ListTile(
                  onTap: () {
                    setState(() {
                      loading = true;
                    });
                    Future.delayed(Duration(seconds: 3), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()));
                      setState(() {
                        loading = false;
                      });
                    });
                  },
                  title: loading
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Text(
                          "LOGOUT",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                  leading: Icon(Icons.logout),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
