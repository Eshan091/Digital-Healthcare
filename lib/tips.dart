import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/login_screen.dart';
import 'package:flutter_application/utils/utils.dart';

class TipScreen extends StatefulWidget {
  const TipScreen({super.key});

  @override
  State<TipScreen> createState() => _TipScreenState();
}

class _TipScreenState extends State<TipScreen> {
  final List tips = [
    'Find the time. Exercise is one of the most important aspects in staying (or becoming) fit and healthy. Experts recommend that you should aim to be active for at least 30 minutes per day.',
    'There are definitely some perks to working out at a gym--air conditioning and televisions are a few. But scientists report that exercising outdoors, at least part of the time, can have major benefits.',
    'Eating right has a lot of benefits. It will help you maintain a healthy weight, improve your skin, and give you more energy. One of the best ways to eat a healthy diet is to cook your own food. Reports show that people who cook their own meals consume lower levels of sugar and fats.',
    'Add green leafy vegetables to your diet. They are a rich source of proteins, iron, calcium, and fiber. Green leafy vegetables are easy to prepare and quite appetizing too.',
    'The body receives a significant amount of minerals through water. Drinking plenty of water also helps detoxify the body and gives you a  glowing skin. However, avoid drinking water during meals as it slows down the digestion process. ',
    'One of the easiest and obvious ways to digest food is to  chew it. Most people often eat their food in a hurry and skip chewing their food properly. While what you eat eventually gets digested, but a barely chewed morsel takes more time and tires your digestive system.',
    'Although it may appease your taste buds, fast food usually does a lot of harm to the body. It can be unhygienic and also high on harmful fats like trans-fats. Also, carbonated soft drinks have a high sugar content which will lead to obesity, diabetes, and dental caries. ',
    'Add Greek yogurt to your diet Greek yogurt (or Greek-style yogurt) is thicker and creamier than regular yogurt.It has been strained to remove its excess whey, which is the watery part of milk. This results in a final product that’s higher in fat and protein than regular yogurt.',
    'The way you prepare your food can drastically change its effects on your health.Grilling, broiling, frying, and deep-frying are all popular methods of preparing meat and fish.However, during these types of cooking methods, several potentially toxic compounds are formed.',
    'Added sugars are lurking in many seemingly healthy drinks, like fruit punch and sports drinks. Unfortunately, taking in too many added sugars has been linked to adverse outcomes including obesity, cardiovascular disease, type 2 diabetes, nonalcoholic fatty liver disease and metabolic syndrome.',
    'Highly processed meats like lunch meats, bacon and sausage are certainly convenient and incredibly appetizing. But these meat choices can also be loaded with nitrates, a component that, when heated, can produce potentially cancer-causing compounds. ',
    'One of the easiest and obvious ways to digest food is to  chew it. Most people often eat their food in a hurry and skip chewing their food properly. While what you eat eventually gets digested, but a barely chewed morsel takes more time and tires your digestive system.',
    'Although it may appease your taste buds, fast food usually does a lot of harm to the body. It can be unhygienic and also high on harmful fats like trans-fats. Also, carbonated soft drinks have a high sugar content which will lead to obesity, diabetes, and dental caries. ',
    'Add Greek yogurt to your diet Greek yogurt (or Greek-style yogurt) is thicker and creamier than regular yogurt.It has been strained to remove its excess whey, which is the watery part of milk. This results in a final product that’s higher in fat and protein than regular yogurt.',
    'The way you prepare your food can drastically change its effects on your health.Grilling, broiling, frying, and deep-frying are all popular methods of preparing meat and fish.However, during these types of cooking methods, several potentially toxic compounds are formed.',
    'Added sugars are lurking in many seemingly healthy drinks, like fruit punch and sports drinks. Unfortunately, taking in too many added sugars has been linked to adverse outcomes including obesity, cardiovascular disease, type 2 diabetes, nonalcoholic fatty liver disease and metabolic syndrome.',
    'Highly processed meats like lunch meats, bacon and sausage are certainly convenient and incredibly appetizing. But these meat choices can also be loaded with nitrates, a component that, when heated, can produce potentially cancer-causing compounds. ',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Icon(
                  Icons.health_and_safety,
                  size: 35,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Healthy tips',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.health_and_safety,
                  size: 35,
                )
              ],
            ),
          ),
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
            color: const Color.fromARGB(255, 221, 28, 14),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: tips.length,
                  itemBuilder: (context, index) {
                    return Mysqaure(
                      child: tips[index],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class Mysqaure extends StatelessWidget {
  final String child;
  Mysqaure({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Container(
          height: 155,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 164, 9, 9),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Text(
              child,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
