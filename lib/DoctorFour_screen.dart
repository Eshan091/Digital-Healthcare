import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/appointment.dart';
import 'package:flutter_application/signup_screen.dart';

class DoctorFour extends StatefulWidget {
  const DoctorFour({super.key});

  @override
  State<DoctorFour> createState() => _DoctorFourState();
}

class _DoctorFourState extends State<DoctorFour> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 220, 220),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text('Doctor Details'),
        ),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              AboutDoctor(),
              DetailBody(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Material(
                  color: Color.fromARGB(255, 22, 199, 196),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => SignupScreen()));

                      // Navigator.of(context).pop();
                      setState(() {
                        loading = true;
                      });
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AppointmentScreen()));
                        setState(() {
                          loading = false;
                        });
                      });
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child: Center(
                        child: loading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Book appointment',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    // Config().init.infinity,
    return Container(
      width: double.infinity,
      child: Column(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: CircleAvatar(
              radius: 65.0,
              backgroundImage: AssetImage(
                'images/pnjaiswal.png',
              ),
              backgroundColor: Colors.white54,
            ),
          ),
          Text(
            'DR. P N JAISWAL',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'MBBS, MS',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Text(
              'DR P.N JAISWAL ENT CLINIC',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 3),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(children: <Widget>[
        DoctorInfo(),
        SizedBox(
          height: 20,
        ),
        Text(
          'About doctor',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Dr. P.N Jaiswal is one of the best otolaryngologists in Gorakhpur. He completed his MBBS degree at GSVM Medical College Kanpur in 2004 and his MS in ENT from CSMMU (King George Medical University), Lucknow in 2010.  ',
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              height: 1,
              wordSpacing: 1,
              fontStyle: FontStyle.italic),
          softWrap: true,
          textAlign: TextAlign.justify,
        )
      ]),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        infoCard(
          label: 'patients',
          value: '200',
        ),
        SizedBox(
          width: 15,
        ),
        infoCard(
          label: 'Experinces',
          value: '10+ years',
        ),
        SizedBox(
          width: 15,
        ),
        infoCard(
          label: 'Rating',
          value: '4.6',
        )
      ],
    );
  }
}

class infoCard extends StatelessWidget {
  const infoCard({super.key, required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(255, 22, 199, 196),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 15,
        ),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
