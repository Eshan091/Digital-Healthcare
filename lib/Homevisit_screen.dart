import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/home_screen.dart';
import 'package:flutter_application/navbar_roots.dart';
import 'package:flutter_application/signup_screen.dart';
import 'package:flutter_application/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';

class HomeVisit extends StatefulWidget {
  const HomeVisit({super.key});

  @override
  State<HomeVisit> createState() => _HomeVisitState();
}

class _HomeVisitState extends State<HomeVisit> {
  final _formKey = GlobalKey<FormState>();
  Color _inputTextColor = Colors.white;
  TextEditingController _date = TextEditingController();
  TextEditingController _pcontroller = TextEditingController();

  TextEditingController _econtroller = TextEditingController();
  TextEditingController _phcontroller = TextEditingController();

  TextEditingController _dcontroller = TextEditingController();

  bool loading = false;
  void showAlert() {
    QuickAlert.show(
        context: context,
        title: "Success",
        text:
            "Form Submitted Succesfully ,you will soon receive a confirmation call",
        type: QuickAlertType.success);
  }

  Future addUserdetails(
      String pname, String email, int phone, String date, String doctor) async {
    await FirebaseFirestore.instance.collection('homevisit').add({
      'patient name': pname,
      'email': email,
      'phone number': phone,
      'date': date,
      'doctor': doctor,
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _date.dispose();
    _pcontroller.dispose();
    _phcontroller.dispose();
    _econtroller.dispose();
    _dcontroller.dispose();
    super.dispose();
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
              Color.fromARGB(255, 27, 175, 225),
              Color.fromARGB(255, 44, 17, 48),
            ],
          ),
        ),
        child: SingleChildScrollView(
            child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Icon(
                  Icons.health_and_safety,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextFormField(
                          controller: _pcontroller,
                          style: TextStyle(color: _inputTextColor),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(
                              "Patient Name",
                              style: TextStyle(color: Colors.white),
                            ),
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
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(
                              "enter email",
                              style: TextStyle(color: Colors.white),
                            ),
                            prefixIcon: Icon(
                              Icons.mail_outline,
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
                                    .hasMatch(value!)) {
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
                          controller: _date,
                          style: TextStyle(color: _inputTextColor),
                          decoration: InputDecoration(
                            label: Text(
                              "Select Date",
                              style: TextStyle(color: Colors.white),
                            ),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.calendar_today_rounded,
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
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2023),
                                lastDate: DateTime(2101));
                            if (pickDate != null) {
                              String formatteddate =
                                  DateFormat("yyyy-MM-dd").format(pickDate);
                              setState(() {
                                _date.text = formatteddate.toString();
                              });
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please select appointment date';
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
                          controller: _dcontroller,
                          style: TextStyle(color: _inputTextColor),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(
                              "From which hospital you want to call doctor?",
                              style: TextStyle(color: Colors.white),
                            ),
                            prefixIcon: Icon(
                              Icons.health_and_safety_outlined,
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
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: Material(
                    color: Color.fromARGB(255, 20, 219, 27),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          Future.delayed(Duration(seconds: 2), () {
                            showAlert();

                            setState(() {
                              loading = false;
                            });
                          });

                          //adding details
                          addUserdetails(
                              _pcontroller.text.toString(),
                              _econtroller.text.toString(),
                              int.parse(_phcontroller.text.toString()),
                              _date.text.toString(),
                              _dcontroller.text.toString());
                        }
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        child: Center(
                          child: loading
                              ? CircularProgressIndicator(
                                  strokeWidth: 3,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Submit form",
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
            ],
          ),
        )),
      ),
    );
  }
}
