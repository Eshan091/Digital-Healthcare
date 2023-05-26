import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User = FirebaseAuth.instance.currentUser!;

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
                  child: Icon(
                    Icons.person,
                    size: 130,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(50)),
                child: ListTile(
                  title: Text(
                    User.email!
                        .substring(0, User.email!.indexOf('@'))
                        .toUpperCase(),
                  ),
                  leading: Icon(Icons.person),
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
                  title: Text(
                    User.email!
                        .substring(0, User.email!.indexOf('@'))
                        .toUpperCase(),
                  ),
                  leading: Icon(Icons.call),
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
                  title: Text(User.email!),
                  leading: Icon(Icons.email_rounded),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 24, 9),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));
                  },
                  title: Text(
                    "LOGOUT",
                    style: TextStyle(fontSize: 22),
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
