import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../components/rounded_button.dart';


class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RoundedButton(
                  colour: Colors.lightBlueAccent,
                  title: 'Giriş',
                  onPressed: () {
                    Navigator.pushNamed(context, 'login_screen');
                  },
                ),
                RoundedButton(
                    colour: Colors.blueAccent,
                    title: 'Kayıt ol',
                    onPressed: () {
                      Navigator.pushNamed(context, 'registration_screen');
                    }),
              ]),
        ));
  }
}